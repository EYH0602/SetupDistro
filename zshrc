

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/eeeh/.oh-my-zsh"
export VISUAL=vim
export EDITOR="$VISUAL"
DISABLE_UPDATE_PROMPT=true

# customize commeval
alias jq="jq ."
alias textmatlab="matlab -nodesktop"
alias handin="cp Makefile *.c* *.h* ./Autograder"
alias py=python3
alias pwsh=powershell.exe
alias rm=trash
alias mkpkg="makepkg -si"
alias csif="ssh yifengh@pc20.cs.ucdavis.edu"
alias ubuntuVM="ssh hyf@127.0.0.1 -p 2222"
alias gitlog="git log --all --graph --decorate"
alias start=xdg-open
alias changecolor="papirus-folders --theme Papirus-Dark -C"
alias color="papirus-folders -l --theme Papirus-Dark"
alias defaultColor="papirus-folders -D --theme Papirus-Dark"
alias restoreColot="papirus-folders -Ru"
# sync to OneDrive
alias sync="onedrive --synchronize"
alias monitor="onedrive --monitor"
# monitor hardware


# Steelseries keyboard RGB
alias keyboardRGB="msi-perkeyrgb --model GS65"

# alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
# alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vp='vim -w PKGBUILD'
alias more=less

# open files with ...
alias -s circ=logisim
alias -s c=ccat
alias -s cpp=ccat
alias -s py=ccat
alias -s txt=vim
alias -s md=typora
alias -s tex=code
alias -s html=code
alias -s css=code
alias -s js=code
alias -s json=code
alias -s gz="tar xvf"
alias -s tar="tar xvf"


[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh

# Vim Mode

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
# ZSH_THEME="fishbone++"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH_THEME="typewritten"
# TYPEWRITTEN_SYMBOL="$"
# TYPEWRITTEN_CURSOR="terminal"
# TYPEWRITTEN_RIGHT_PROMPT_PREFIX="0_0 "
# TYPEWRITTEN_PROMPT_LAYOUT="multiline"
# TYPEWRITTEN_GIT_RELATIVE_PATH=true


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=(
    "sorin"
    "miloshadzic"
    "kolo"
    "muse"
)

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colored-man-pages
    vi-mode
    vscode
    colorize
    copydir
    web-search
    themes
    # wakatime
)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

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

# hide user@hostname
# prompt_context() {
#   # Custom (Random emoji)
#   emojis=("🔥" "🍻" "🚀" "💡" "🚦" "🌙")   
#   RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
#   prompt_segment black default "%T" # ${emojis[$RAND_EMOJI_N]}"
# }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zsh-scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

echo "${RED}Hello ${BLUE}Ethan! ${GREEN}Have ${MAGENTA}a nice day${YELLOW}!"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


