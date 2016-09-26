# Is this sufficient?
# zstyle :compinstall filename '/home/$USERNAME/.zshrc
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#setopt histignorealldups sharehistory

# Set up the prompt
zstyle ':completion:*:*:-command-:*:commands' group-name commands
zstyle ':completion:*:*:-command-:*:functions' group-name functions
# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.history

# Set umask to a more restrictive one
umask 077

# Enable autocompletion for commands, hostnames etc.
autoload -Uz compinit
compinit

export EDITOR="vim"

# Doing menu completion for arrow keys
# List unkown parameter as Auto-Description STRING
zstyle ':completion:*' auto-description 'Auto-Description: %d'
# Add header after <TAB> completion. Specified what actuall is completed
zstyle ':completion:*' format '%BCompleting: %F{blue}%d%f%b'
zstyle ':completion:*' menu
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose true


# Use vi keybindings even if our EDITOR is set to emacs
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# zsh Options {{{
  ## Changing Directories
    # change dir without cd infront
    setopt AUTO_CD

  ## Completion
    # sets cursor to the end of completion word
    setopt ALWAYS_TO_END

  ## History Options
    # share/synchronise history with shells
    setopt SHARE_HISTORY
    # no duplicates in history
    setopt HIST_IGNORE_ALL_DUPS
    # delete unused spaces infront of commands in history
    setopt HIST_REDUCE_BLANKS
    # no beep at end of history
    setopt NO_HIST_BEEP

  ## Input/Output Options
    # don't ask for rm * command just do it
    setopt RM_STAR_SILENT

  ## Job Control Options
    # no terminating of background jobs if shell is terminated
    setopt NO_HUP 
    # use long format for jobs lists
    setopt LONG_LIST_JOBS
    # notify bg job after <RETURN> 
    setopt NO_NOTIFY 

  ## Scipts and Functions
    # restore traps and options after function call
    setopt LOCAL_OPTIONS
    setopt LOCAL_TRAPS
    # $? contains the real error number of the rightmost failed command
    setopt PIPE_FAIL

  ## Shell Emulation
    # use array indexes beginning with 0
    setopt KSH_ARRAYS

  ## zle Options
    # enable zle mode
    setopt ZLE
    # no shell beeping
    setopt NO_BEEP

# }}} end zsh options

# Some Aliases
alias ll='ls -l --color=auto'
alias la='ls -lA --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hgrep='history 0 |grep --color=auto '
alias ggrep='git grep'
alias fuck='sudo `history -n -1`'
alias please=fuck

# Suffix Aliases
alias -s log=vim
alias -s pl=vim

setopt PROMPT_SUBST
# Configure Prompt
# Left Prompt
tick='\u2713'
PS1='[%n@%m:%1~]%(?..(%F{red}%?%f%))%# '
# Right Prompt
RPS1='%(t.[Ding!].%(t30.[Dong!].[%T])'


# Force to clear Terminal after every Logout
TRAPEXIT() {
  if [[ ! -o login ]]; then
  fi
}