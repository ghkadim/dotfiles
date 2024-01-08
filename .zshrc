# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
    git
    docker
    docker-compose
    kubectl
    helm
#    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PROMPT='$(kube_ps1)'$PROMPT

autoload -U colors; colors

#source <(kubectl completion zsh)
#alias aws='docker run --rm -it -v ~/.aws:/root/.aws -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN amazon/aws-cli '

#export GOROOT=~/sdk/go1.18
#export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/go
export GOBIN="${GOPATH}/bin"

#export PATH="${GOBIN}:${PATH}"
export PATH="${HOME}/src/utils/:${PATH}"
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="${PATH}:${HOME}/Library/Python/3.8/bin/"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

#export KUBECONFIG=~/.kube/kubeconfig_merged
export GOPRIVATE=github.com/Mirantis/*,github.com/shipa-corp/*

#export AWS_PROFILE="AdministratorAccess-133334835781"

alias k="kubectl "
#alias kg="kubectl get "
#alias ke="kubectl edit "
#alias ka="kubectl apply "
#alias kc="kubectl create "
alias watch="watch "

alias kx="kubectx "
alias ken="kubens "

# The next line updates PATH for Yandex Cloud CLI.
#if [ -f '/Users/dkasyanov/yandex-cloud/path.bash.inc' ]; then source '/Users/dkasyanov/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
#if [ -f '/Users/dkasyanov/yandex-cloud/completion.zsh.inc' ]; then source '/Users/dkasyanov/yandex-cloud/completion.zsh.inc'; fi

autoload -U compinit; compinit
#autoload -U +X bashcompinit && bashcompinit
#complete -o nospace -C /usr/local/bin/terraform terraform


export KUBE_TMUX_NS_ENABLE=false
tmux has-session -t src 2>/dev/null || (cd ~/src && tmux new -d -s src)
tmux has-session -t tmp 2>/dev/null || (cd /tmp; tmux new -d -s tmp)
# tmux has-session -t tf-lab 2>/dev/null || (cd ~/go/src/github.com/ghkadim/terraform_certified && tmux new -d -s tf-lab)

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/dkasyanov/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dkasyanov/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/dkasyanov/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dkasyanov/google-cloud-sdk/completion.zsh.inc'; fi
