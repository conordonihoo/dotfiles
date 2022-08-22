alias gcal="gcal -H '\e[34m:\e[0m:\e[32m:\e[0m' -q US_AK"
alias bc="bc -l"

# set default tmux to use 256 colors and utf-8 encoding
alias tmux='tmux -2u'
alias tripane='tmux select-layout "c23d,274x76,0,0{77x76,0,0[77x48,0,0,92,77x27,0,49,94],196x76,78,0,93}"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# wttr.in weather and moon phase
alias wthr='curl wttr.in'
alias mun='curl wttr.in/moon'

# Ipython profiles
alias isympy='ipython -i -c "init_printing(use_unicode=True)" --profile sympy'
alias inumpy='ipython --profile numpy'
alias pylab='ipython -i -c "%matplotlib" --profile plot'
alias ictrl='ipython -i -c "%matplotlib" --profile ctrl'

# JPL Horizons Database
alias hzn='telnet horizons.jpl.nasa.gov 6775'

# Tyler's navi alias
alias navi='sudo tshark -Y "(60000 <= udp.dstport && udp.dstport <= 60009) || (60100 <= udp.dstport && udp.dstport <= 60109)"'

# Git aliases
alias gits="git status"
alias gitl="git log"
alias gitll="git log --decorate --graph --oneline"
alias gurl="git remote -v | awk '{print \$2}' | head -n1"

# Trick aliases
alias trick-CP="trick-CP TRICKIFIED=1"
alias trick-RB="make spotless && trick-CP"
alias trick-XX="ccache -Czs && make spotless && trick-CP"

# Cesium aliases
alias ceez="node server.js --public --port 5080"

# Groundtrack.py aliases
## VAFB
alias vafb_seco="groundtrack --wlong -140.5 --slat 17.5 --elong -99.5 --nlat 42.5 --grid 10 10"
alias vafb_coast="groundtrack --wlong -122.0 --slat 33.5 --elong -119.0 --nlat 35.5 --grid 1 1"
## CCAFS
alias ccafs_coast="groundtrack --wlong -81.81 --slat 27.07 --elong -77.82 --nlat 29.84 --grid 1 1"
alias ccafs_seco="groundtrack --wlong -86.56 --slat 23.24 --elong -63.04 --nlat 38.21 --grid 10 10"
## MARS
alias mars_coast="groundtrack --wlong -76.67 --slat 36.49 --elong -71.65 --nlat 39.45 --grid 1 1"
alias mars_seco="groundtrack --wlong -79.74 --slat 34.58 --elong -68.26 --nlat 41.32 --grid 10 10"
## PSCA
alias psca_seco="groundtrack --wlong -168 --slat 42.63 --elong -139.9 --nlat 64.9 --grid 10 10"
alias psca_coast="groundtrack --wlong -158.5 --slat 53.8 --elong -147.8 --nlat 60.2 --grid 1 1"
## SSC
alias ssc_seco="groundtrack --wlong -13.2644 --slat 48.2457 --elong 9.17875 --nlat 74.9386 --grid 10 10"
alias ssc_coast="groundtrack --wlong -2.34995 --slat 59.7682 --elong 0.0673557 --nlat 62.4381 --grid 1 1"

# Vim aliases
alias vi="vim"

# Python aliases
alias python="python3"
alias pip="pip3"

# JupyterLab
alias jnb="jupyter notebook --ip 0.0.0.0 --port 8890 --no-browser --NotebookApp.terminals_enabled=False"
alias jlab="jupyter lab --ip 0.0.0.0 --port 8890 --no-browser --NotebookApp.terminals_enabled=False"
