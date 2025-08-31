# detect distribution
distribution () {
	dtype="unknown"

    if [ -r /etc/os-release ]; then
		source /etc/os-release
		case $ID in
		    debian)
		        dtype="debian"
		        ;;
		    manjaro | manjaro-arm)
				    dtype="manjaro"
    				;;
		    arch)
    				dtype="arch"
    				;;
		    archarm)
    				dtype="archarm"
    				;;
		esac
	fi

	echo $dtype
}
DISTRIBUTION=$(distribution)


# History
case "$DISTRIBUTION" in
  "manjaro" | "arch" | "archarm")
  	HISTSIZE=10000
    ;;
  "debian")
  	HISTSIZE=1000
    ;;
esac
HISTFILE=~/.histfile
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Autocomplete (compinstall)
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
if [ $EUID -gt 0 ]; then
	autoload -Uz compinit
	compinit
fi


# zsh plugins
case "$DISTRIBUTION" in
	"manjaro" | "arch" | "archarm")
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		;;
	"debian")
		source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		;;
esac


# various flags
unsetopt beep
setopt hist_ignore_all_dups


# keybindings
bindkey -e
bindkey "\e[3~" delete-char
bindkey "\e[H"  beginning-of-line
bindkey "\e[F"  end-of-line
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word


if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# TERM for root in debian
if [[ "$DISTRIBUTION" == "debian" ]]; then
  export TERM=xterm-256color
fi

# Aliases
case "$DISTRIBUTION" in
  "debian" | "arch")
    alias ls='lsd --group-dirs first --date +"%Y-%m-%d %H:%M:%S" --hyperlink auto'
    ;;
  "manjaro" | "archarm")
    alias ls='lsd --group-dirs first --date +"%Y-%m-%d %H:%M:%S"'
    ;;
esac
alias ll='ls -l'
alias la='ls -la'
alias cd..='cd ..'
alias grep='grep --color=auto'
alias ncdu='ncdu --color dark'
alias diskspace='du -Sh | sort -n -r | less'
alias externalip='curl -s https://ringlogic.com/ip/'
alias sufw='sudo ufw status numbered'
alias ip='ip -c'
alias gits='git status'
alias gitd='git diff'
alias gita='git add'
alias gitap='git add -p'
alias gitc='git commit -m'
# alias gitP='git push muthur ; git push github' # this is a bash script now
alias gitp='git pull'
alias catp='cat -p --no-pager'
alias lg='lazygit'
alias v='nvim'
alias sv='sudo nvim'
alias dcp='docker compose pull'
alias dcu='docker compose up -d'
alias dcl='docker compose logs -f'
alias dcd='docker compose down'

case "$DISTRIBUTION" in
  "debian")
  	alias cat='batcat --wrap never'
  	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
    ;;
  "manjaro" | "arch" | "archarm")
  	alias cat='bat --wrap never'
  	alias man='batman'
    ;;
esac


# Create and go into the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}


# ll after cd or z
function cd() {
	builtin cd "$@" && ll
}


# Initialize fzf
case "$DISTRIBUTION" in
  "debian")
  	source /usr/share/doc/fzf/examples/key-bindings.zsh
    ;;
  "manjaro" | "arch" | "archarm")
    source <(fzf --zsh)
    ;;
esac


# Initialize Zoxide
eval "$(zoxide init zsh)"
if [ "$DISTRIBUTION" != "debian" ]; then
	function z() {
	    __zoxide_z "$@" && ll
	}
fi


# Prompts (adapted from https://dotshare.it/dots/590)
setopt prompt_subst
setopt promptsubst
setopt promptpercent

autoload colors; colors;

display_logo() {
	if [[ $EUID == 0 ]]; then
		echo "%{$fg[red]%} %{$reset_color%}"
	else
		case "$DISTRIBUTION" in
			"debian")
				echo "%{$fg[red]%} %{$reset_color%}"
				;;
			"manjaro")
				echo "%{$fg[green]%} %{$reset_color%}"
				;;
			"arch" | "archarm")
				echo "%{$fg[blue]%} %{$reset_color%}"
				;;
			*)
				echo "%{$fg[red]%} %{$reset_color%}"
		esac
	fi
}
display_git_info() {
    _GIT_STATUS=$(gitstatus.py 2>/dev/null)
    __CURRENT_GIT_STATUS=("${(@s: :)_GIT_STATUS}")
    GIT_BRANCH=$__CURRENT_GIT_STATUS[1]
    GIT_AHEAD=$__CURRENT_GIT_STATUS[2]
    GIT_BEHIND=$__CURRENT_GIT_STATUS[3]
    GIT_STAGED=$__CURRENT_GIT_STATUS[4]
    GIT_CONFLICTS=$__CURRENT_GIT_STATUS[5]
    GIT_CHANGED=$__CURRENT_GIT_STATUS[6]
    GIT_UNTRACKED=$__CURRENT_GIT_STATUS[7]
    GIT_STASHED=$__CURRENT_GIT_STATUS[8]
    GIT_CLEAN=$__CURRENT_GIT_STATUS[9]
    GIT_DELETED=$__CURRENT_GIT_STATUS[10]
    GIT_UPSTREAM=$(git rev-parse --abbrev-ref --symbolic-full-name "@{upstream}" 2>/dev/null) && GIT_UPSTREAM="${ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR}${GIT_UPSTREAM}"

    if [ -n "$__CURRENT_GIT_STATUS" ]; then
		STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH$GIT_UPSTREAM%{${reset_color}%}"
		STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
		if [ "$GIT_BEHIND" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{${reset_color}%}"
		fi
		if [ "$GIT_AHEAD" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{${reset_color}%}"
		fi
		if [ "$GIT_STAGED" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
		fi
		if [ "$GIT_CONFLICTS" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
		fi
		if [ "$GIT_CHANGED" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
		fi
		if [ "$GIT_DELETED" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_DELETED$GIT_DELETED%{${reset_color}%}"
		fi
		if [ "$GIT_UNTRACKED" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED%{${reset_color}%}"
		fi
		if [ "$GIT_STASHED" -ne "0" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STASHED$GIT_STASHED%{${reset_color}%}"
		fi
		if [ "$GIT_CLEAN" -eq "1" ]; then
			STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
		fi
		STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
	else
		STATUS=""
	fi

    echo "$STATUS"
}

# Default values for the appearance of the prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="─["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{m%G%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}%{d%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}%{?%G%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg_bold[blue]%}%{s%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SEPARATOR="->"

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
local git_info='$(display_git_info)%{$reset_color%}'

RPROMPT=""
PROMPT="
%B $(display_logo)─┬─[${user_host}%B]─[${current_dir}%B]${git_info}%(1j.
%B    │ %j background jobs.)%b
%B    ╰─>%(?..%{$fg[red]%})%(?.. [%?])%{$reset_color%}%b "


# Autorun
fastfetch
echo
ll
