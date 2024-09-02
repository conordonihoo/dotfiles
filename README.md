# Dotfiles
This repo tracks my progress towards standardizing my coding environment. Specifically, it standardizes `bash`, `vim`, `nvim`, and `tmux` settings that I rely on to be productive when coding.
## Visuals
The dotfiles will enhance your coding environment to look like this:

![Alt text](./demo.png?raw=True "Title")



And some `matplotlib` styles:

![Alt text](./lightplot.png?raw=True "Title")

![Alt text](./darkplot.png?raw=True "Title")

## Installation
Follow these instructions to setup and use the dotfiles:
1. The dotfiles assume the following prerequisites are true about your coding environment:
    * Your Unix shell is `bash`.
    * `vim` is installed.
    * `tmux` is installed.
    * `nvim` is installed at `/opt/nvim-linux64/bin` (follow the instructions [here](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux)).
        * `ripgrep` is installed.
        * `fd` is installed.
        * Some Nerd Font is installed from [here](https://www.nerdfonts.com/) and applied to your terminal.
2. Clone the repo.
  ```sh
  git clone https://github.com/conordonihoo/dotfiles.git
  ```
3. Install.
  ```sh
  cd dotfiles && ./install.sh
  ```
