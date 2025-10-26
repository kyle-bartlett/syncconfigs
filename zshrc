# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# 🚀 LIFE-CHANGING ALIASES
alias ll="eza --icons --long --git --header"
alias la="eza --icons --long --all --git"
alias lt="eza --icons --tree --level=2"
alias cat="bat"
alias grep="rg"
alias find="fd"
alias ps="btop"
alias help="tldr"

# 📁 Quick Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias home="cd ~"
alias desktop="cd ~/Desktop"
alias downloads="cd ~/Downloads"
alias apps="cd /Applications"

# 🧹 System Cleaning
alias cleanup="brew cleanup && brew autoremove"
alias dsclean="find . -name '.DS_Store' -delete"

# 🔍 Better file search
alias search="rg --hidden --ignore-case"
alias fzfp="fzf --preview 'bat --color=always {}'"

# 📊 System Info
alias cpu="btop"
alias memory="vm_stat"
alias disk="df -h"

# 🔄 Quick reload
alias reload="source ~/.zshrc"
alias edit="code ~/.zshrc"


# 🤖 AUTOMATION SHORTCUTS
alias organize="~/Development/03-Tools-And-Scripts/organize_downloads.sh"
alias sysclean="~/Development/03-Tools-And-Scripts/system_cleanup.sh"
alias quickfix="dsclean && organize && sysclean"


# ⚡ SYSTEM OPTIMIZATIONS
# Fast directory navigation with z (autojump)
eval "$(zoxide init zsh)"

# Better history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Colorful terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


# 🚀 DEVELOPMENT NAVIGATION
export DEV_HOME="$HOME/Development"
alias dev="cd $DEV_HOME"
alias active="cd $DEV_HOME/01-Active-Projects"
alias learn="cd $DEV_HOME/02-Learning-Experiments"
alias tools="cd $DEV_HOME/03-Tools-And-Scripts"
alias archive="cd $DEV_HOME/04-Archive"
alias templates="cd $DEV_HOME/05-Templates"
alias sandbox="cd $DEV_HOME/99-Sandbox"
# alias claude="cd $DEV_HOME/Claude-Tools" # Commented out due to Claude Code CLI conflict
alias gitrepos="cd $DEV_HOME/Git-Repos"
alias dotfiles="cd $DEV_HOME/Dotfiles"


# 🚀 PROJECT MANAGEMENT SHORTCUTS
alias newproject="~/Development/03-Tools-And-Scripts/new_project.sh"
alias fixgit="~/Development/03-Tools-And-Scripts/fix_git_mess.sh"
alias syncconfigs="cd ~/Development/Dotfiles && git add . && git commit -m 'Update configs' && git push"
alias updateconfigs="cd ~/Development/Dotfiles && git pull"

# 📊 Quick project info
alias projects="ls -la ~/Development/01-Active-Projects/"
alias recent="tail -10 ~/Development/.recent_projects"


# 🔍 GitHub Repository Analysis
alias whatrepo="~/Development/03-Tools-And-Scripts/analyze_repo.sh"
alias analyzerepo="~/Development/03-Tools-And-Scripts/analyze_repo.sh"


# 🎯 Software Installation & Security
alias installhelp="~/Development/03-Tools-And-Scripts/smart_software_installer.sh"
alias checksoftware="~/Development/03-Tools-And-Scripts/verify_download.sh"
alias scandownloads="~/Development/03-Tools-And-Scripts/verify_download.sh"


# 🚀 DUAL MAC MANAGEMENT
alias dualmac="~/Development/03-Tools-And-Scripts/dual_mac_installer.sh"
alias dualinstall="~/Development/03-Tools-And-Scripts/dual_mac_installer.sh"  
alias checkdual="~/Development/03-Tools-And-Scripts/check_dual_setup.sh"
alias tailstat="tailscale status"


# 🤖 CLAUDE CODE ALIASES (Fixed conflicts)
# Remove conflicting aliases first
unalias cc 2>/dev/null
unalias claude 2>/dev/null

# Proper Claude Code aliases (no conflicts)
alias claudecode="claude"
alias ccli="claude"
alias claudeskip="claude --dangerously-skip-permissions"
alias claudefast="claude --dangerously-skip-permissions"
alias claudetools="cd $DEV_HOME/Claude-Tools"


# 🌐 REMOTE MAC MANAGEMENT
alias wake_grey="wakeonlan 2a:08:23:54:f4:b5"
alias open_grey="ssh kyle-bartlett@100.125.155.20"

