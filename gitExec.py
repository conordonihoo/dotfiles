#!/usr/bin/python3

import argparse
from enum import Enum
from typing import Tuple, Optional
from git import Repo
from pathlib import Path
from os import environ
import subprocess as sp

class GitCommand(Enum):
    PULL     = 0
    STATUS   = 1
    CHECKOUT = 2
    BRANCH   = 3

class GitResult(Enum):
    IGNORED = 0
    SUCCESS = 1
    FAILURE = 2

class Colors:
    BLUE   = '\033[38;5;147m'
    GREEN  = '\033[38;5;157m'
    PINK   = '\033[38;5;225m'
    RED    = '\033[91m'
    ENDC   = '\033[0m'

def processGitRepo(path: Path, command: GitCommand, branch: Optional[str] = None) -> Tuple[GitResult, Optional[str], Optional[str]]:
    '''
    Process a git repository based on the given command using GitPython.

    ### Inputs:
    * path (Path)          - the potential git repository
    * command (GitCommand) - command indicating the operation to perform
    * branch (str | None)  - optional branch name for checkout operations

    ### Outputs:
    * (GitResult) indicating the result of the function
    * (str | None) current branch name (or None if not a git repo)
    * (str | None) command output (or None if ignored/failed)
    '''
    # Helper function for git pull
    def pullRepo(repo: Repo, output: str) -> str:
        # Perform git pull
        output += str(repo.git.pull()) + '\n'
        # Update submodules
        if repo.submodules:
            try:
                ret = sp.run(
                    ['git', 'submodule', 'update', '--init', '--recursive'],
                    cwd=repo.working_dir,
                    capture_output=True
                )
                if ret.returncode == 0:
                    output += f'{Colors.PINK}Updated submodules.{Colors.ENDC}\n'
                else:
                    output += f'{Colors.RED}Failed to update submodules:\n{ret.stdout.decode()}\n{ret.stderr.decode()}{Colors.ENDC}\n'
            except Exception as e:
                output += f'{Colors.RED}Failed to update submodules:  {e}{Colors.ENDC}\n'
        return output
    # Check if directory exists and is a git repo
    if not path.is_dir() or not (path / '.git').exists():
        return GitResult.IGNORED, None, None
    try:
        repo = Repo(path)
        output = ''
        if command == GitCommand.PULL:
            output = pullRepo(repo, output)
        elif command == GitCommand.STATUS:
            output = repo.git.status()
        elif command == GitCommand.CHECKOUT and branch:
            # Check if branch exists
            local_refs = [ref.name for ref in repo.references]
            remote_refs = [ref.name.replace('origin/', '') for ref in repo.remote().refs]
            branches = set(local_refs + remote_refs)
            # check if branch exists
            if branch in branches:
                output = str(repo.git.checkout(branch))
                output = pullRepo(repo, output)
            # if not, see if any branch starts with that substring
            else:
                for b in branches:
                    if b.startswith(branch):
                        output = str(repo.git.checkout(b))
                        output = pullRepo(repo, output)
                        break
        current_branch = repo.active_branch.name
        return GitResult.SUCCESS, current_branch, output
    except Exception as e:
        return GitResult.FAILURE, None, str(e)

def formatOutput(output: str) -> str:
    '''Format command output with proper indentation and colorize warnings.'''
    if not output:
        return ''
    lines = output.splitlines()
    formatted_lines = []
    # Process remaining lines with indentation
    for line in lines:
        line = line.strip()
        # Colorize specific git status warnings
        if any(warn in line.lower() for warn in [
            'changes to be committed:',
            'changes not staged for commit:',
            'untracked files:',
        ]):
            formatted_lines.append(f'    {Colors.RED}{line}{Colors.ENDC}')
        else:
            formatted_lines.append(f'    {line}')

    return '\n'.join(formatted_lines)

def main():
    '''
    GitExec.py main function.

    ### Inputs:
    None

    ### Outputs:
    None
    '''
    # parse args
    parser = argparse.ArgumentParser(description='Process git repositories in subdirectories')
    parser.add_argument('--home', type=str, default=environ['SIMENV'], help='Path to home directory containing git repositories')
    group = parser.add_mutually_exclusive_group()
    group.add_argument('-p', '--pull', action='store_true', help='Pull and update all repositories')
    group.add_argument('-s', '--status', action='store_true', help='Show status of all repositories')
    group.add_argument('-c', '--checkout', type=str, help='Checkout specified branch in all repositories')
    group.add_argument('-b', '--branch', action='store_true', help='Show the current branch of all repositories')
    args = parser.parse_args()
    # process args
    home_path = Path(args.home).resolve()
    print() # white space between the rest of the printout
    if not home_path.is_dir():
        print(f'{Colors.RED}Error: {home_path} is not a valid directory{Colors.ENDC}')
        return
    if args.pull:
        command = GitCommand.PULL
        branch = None
    elif args.status:
        command = GitCommand.STATUS
        branch = None
    elif args.checkout:
        command = GitCommand.CHECKOUT
        branch = args.checkout
    else:
        command = GitCommand.BRANCH
        branch = None
    # loop over directory and process each subdir
    subdirs = [subdir for subdir in home_path.iterdir() if subdir.is_dir()]
    subdirs.sort(key=lambda subdir: subdir.name)
    for subdir in subdirs:
        result, current_branch, output = processGitRepo(subdir, command, branch)
        len_box = max(len(subdir.name), 24)
        if result == GitResult.IGNORED:
            continue
        # repository name header
        print(f'{Colors.GREEN}╭─ {subdir.name}{Colors.ENDC}', end='')
        if result == GitResult.SUCCESS:
            print(f'{Colors.GREEN} {"─" * (len_box - len(subdir.name))}╮{Colors.ENDC}')
            if output:
                formatted_output = formatOutput(output)
                if formatted_output:
                    print(f'{Colors.GREEN}│{Colors.ENDC}')
                    for line in formatted_output.splitlines():
                        print(f'{Colors.GREEN}│{Colors.ENDC} {line}')
        else:
            print()
            print(f'{Colors.GREEN}│{Colors.ENDC} {Colors.RED}Operation failed: {output}{Colors.ENDC}')
        print(f'{Colors.GREEN}╰→ {Colors.BLUE}{current_branch}{Colors.ENDC}')
    print()

if __name__ == '__main__':
    main()
