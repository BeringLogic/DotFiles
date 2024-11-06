
# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


# Autocomplete (compinstall)
zstyle :compinstall filename '/home/phil/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
autoload -Uz compinit


# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autocomplete history file
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh


# various flags
unsetopt beep


# keybindings
bindkey -e
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word


# Aliases
alias cat='bat'
alias ls='lsd --group-dirs first --date +"%Y-%m-%d %H:%M:%S" --hyperlink auto'
alias ll='ls -l'
alias la='ls -la'
alias cd..='cd ..'
alias ncdu='ncdu --color dark'
alias diskspace='du -Sh | sort -n -r | less'
alias externalip='curl -s https://ringlogic.com/ip/'
alias gits='git status'
alias gita='git add'
alias gitap='git add -p'
alias gitc='git commit -m'
alias gitp='git push father && git push github'
alias ip='ip -c'


# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# ll after cd or z
function cd() {
	builtin cd "$@"
	ll
}


# Initialize Zoxide
eval "$(zoxide init zsh)"
function z() {
    __zoxide_z "$@"
    ll
}


# Prompts (adapted from https://dotshare.it/dots/590)
setopt prompt_subst
setopt promptsubst
setopt promptpercent

autoload colors; colors;

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "─[\uea84 %{$fg[yellow]%}${ref#refs/heads/}%{$reset_color%}]"
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

RPROMPT=""
PROMPT="
%B┬─[${user_host}%B]─[${current_dir}%B]${git_branch}%(1j.
%B│ %j background jobs.)%b
%B╰─>%(?..%{$fg[red]%})%(?.. [%?])%{$reset_color%}%b "


# PATH
PATH="${PATH}:/home/phil/Scripts"


# Autorun
/usr/bin/cat ~/Images/manjaro-banner.logo
echo
fortune -a
