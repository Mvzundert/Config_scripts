# DO NOT EDIT THIS FILE
# duplicate this file in zsh/config/zshpaths
# to enable/add your own custom configuration

#Composer path
export PATH="$PATH:$HOME/.composer/vendor/bin"
# Local bin
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$(brew --prefix nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NPM_DIR="$HOME/.npm"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
