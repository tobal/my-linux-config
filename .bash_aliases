# default parameters
alias ls='ls --color'
alias ll='ls -l'
alias la='ll -a'
alias df='df --human-readable'
alias grep='grep --color -n'
alias ping='ping -c 3'
alias mkdir='mkdir -pv'

# custom commands
alias ..='cd ..'
alias ungz='tar xvzpf'
alias unbz='tar xvjpf'
alias f='find . | grep -s --color'
alias o='gnome-open'
alias dirsize='du -h --max-depth=1'

# hardware info
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'

# version control
alias gitlog='git log --pretty=format:"%h - %an, %ar : %s" --graph'
