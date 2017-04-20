# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# -------------------------------------------------------------------
# Plugins
# -------------------------------------------------------------------  

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git mercurial copydir copyfile extract web-search composer history laravel5 docker-compose docker)

# -------------------------------------------------------------------
# Paths
# -------------------------------------------------------------------
 
#Composer path
export PATH="$PATH:$HOME/.composer/vendor/bin"
 
#Drush path
PATH=$PATH:/home/<youruser>/.drush

export PATH=$HOME/bin:/usr/local/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nano'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------

# Browsing the shell
alias ll="ls -lash"
alias myip='wget http://ipinfo.io/ip -qO -'
alias artisan='php artisan'
alias rlzsh='source ~/.zshrc'
alias zshconfig="vim ~/.zshrc" 
alias dlogin="docker login --username=<yourusername>"

# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------

# Jot function allows you to quickly write
# notes to a file from shell.
function jot {
 if [ $1 ]
  then
   cat <<< $1 > /home/<yourusename>/Documents/temp
   cat  /home/<yourusename>/Documents/jot >> /home/<yourusename>/Documents/temp
   mv /home/<yourusename>/Documents/temp /home/<yourusename>/Documents/jot
  else
   gedit /home/<yourusename>/Documents/jot &          
  fi
}

#Fix displaying of ugly user.
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# -------------------------------------------------------------------
# Custom .zshrc source highlighting
# see: https://github.com/zsh-users/zsh-syntax-highlighting
# Why must zsh-syntax-highlighting.zsh be sourced at the end of the .zshrc file?
# zsh-syntax-highlighting.zsh wraps ZLE widgets.
# It must be sourced after all custom widgets have been created (i.e., after all zle -N calls and after running compinit).
# Widgets created later will work, but will not update the syntax highlighting.
# -------------------------------------------------------------------  
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
 