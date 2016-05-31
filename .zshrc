# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

cdf() {
       target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
       if [ "$target" != "" ]; then
               cd "$target"; pwd
       else
               echo 'No Finder window found' >&2
       fi
}

alias f='open -a Finder ./'
alias z="fasd_cd -d"

lb () {
    if [[ $# = 1 ]]; then
        [[ -e "$(pwd)/$1" ]] && open "x-launchbar:select?file=$(pwd)/$1" || open "x-launchbar:select?file=$1"
    else
        open "x-launchbar:select?file=$(pwd)"
    fi
}

cdd() {
	local needle=$(echo "$*" | sed -E 's/ +/.*/g')
	cd "`find . -type d -maxdepth 3 | grep -Ei "${needle}[^/]*$" | fzf -s 20 -1 -0 	-q "$1"`"
}

makemymac() {
echo "Make My MAC Setting!!"
echo "Testing Now - lets' see what you have got!!"
echo

#
# Check if XCode-select is installed
#
echo "Checking if Xcode is installed!"
which -s xcode-select
if [[ $? != 0 ]] ; then
	echo "Xcode is installing"
	xcode-select --install
fi
echo "Xcode is installed"
echo


#
# Check if Synx is installed!
#

echo "Checking if Xcode synx is installed"
which -s synx
if [[ $? != 0 ]] ; then
	echo "synx is installing"
    sudo gem install synx
fi
echo "Synx is installed"
echo


#
# Check if Homebrew is installed!
#
echo "Checking if Homebrew is installed"
which -s brew
if [[ $? != 0 ]] ; then
		echo "Homebrew is installing"
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
		brew update
fi
echo "Homebrew is installed"
echo
#
# Check if Git is installed
#

echo "Checking if git is installed globally"
which -s git || brew install git
echo "Git is installed"
echo
#
# Checking if Node is and at the right version
#
echo "Checking if Node is installed and at the most updated version"
which -s node
if [[ $? != 0 ]] ; then
		echo "Node is installing"
		brew install node
fi
echo "Node is installed"
echo

#
# Check if Bower is installed
#
echo "Checking if bower is installed globally"
which -s bower
if [[ $? != 0 ]] ; then
		echo "bower is installing"
		sudo npm install -g bower
fi
echo "Bower is installed"
echo


#
# Check if Gulp is installed globally
#
echo "Checking if Gulf is installed globablly"
which -s gulp
if [[ $? != 0 ]] ; then
		echo "Gulf is installing"
		sudo npm install -g gulp
fi
echo "Gulf is installed"
echo

#
# Checbhrgifk if Karma is installed
#

echo "Checking if Karma is installed globally"
which -s karma
if [[ $? != 0 ]] ; then
		echo "karma is installing"
		sudo npm install -f karma

fi
echo "Karma is installed"
echo

#
# Check if Sass is installed
#
echo "Checking if Sass is installed globally"
which -s sass
if [[ $? != 0 ]] ; then
		echo "Sass is installing"
		sudo gem install sass
fi
echo "Sass is installed"
echo

#
# Check if zshrc is installed globally
#


echo "Checking if zshrc terminal installed"
which -s zsh
if [[ $? != 0 ]] ; then
		# Install zsh
		# http://www.stevendobbelaere.be/installing-and-configuring-the-oh-my-zsh-shell/
		echo "zshrc is installing"
		curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
		#chsh -s /bin/zsh
fi
echo "zshrc is installed"
echo

#
# Check if alcatraz is installed
#

echo "Checking if Alcatraz is installed"
which -s alcatraz
if [[ $? != 0 ]] ; then
	echo "alcatraz is installing"
	curl -fsSL https://raw.githubusercontent.com/supermarin/Alcatraz/deploy/Scripts/install.sh | sh
fi
echo "alcatraz is installed"
echo


#
# Check if Cocoapods is installed and at the right version
#
echo "Checking if Cocoapods is installed"
gem which cocoapods
if [[ $? != 0 ]] ; then
		echo "Cocoapods is installing"
		sudo gem install cocoapods
fi

echo "Cocoapods is installed"
echo



#
# Check if atom is installed
#
which -s atom
if [[ $? != 0 ]] ; then
		echo "atom is installing"
		cd /Applications
		git clone https://github.com/atom/atom.git
		cd atom
		script/build
fi
echo "atom is installed"
echo

echo "Make My Mac has completed its jobs!!"
echo "Let's Code"
}


alias home='cd ~/'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias RF='rm -rf '
alias h='history'
alias a='ack-grep '
alias c='clear'
alias cdd='cd ~/Desktop'
alias ucssh='ssh rla6100@pc20.cs.ucdavis.edu'
alias v='vim ~/.zshrc'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/Users/Moses/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"


export PATH="/usr/local/sbin:$PATH"
plugins=(git zsh-syntax-highlighting web-search statify)

#
# # User configuration
#
# export GOPATH=$HOME/golang
# export PATH=$PATH:$GOPATH/bin
#
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#
# source $ZSH/oh-my-zsh.sh
#
# source ~/.profile
# source ~/.aliases
#
# export PATH="/usr/local/sbin:$PATH"
