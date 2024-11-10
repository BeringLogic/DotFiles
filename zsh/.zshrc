# detect distribution
distribution () {
	dtype="unknown"

    if [ -r /etc/os-release ]; then
		source /etc/os-release
		case $ID in
		    debian)
		        dtype="debian"
		        ;;
		    manjaro)
				dtype="manjaro"
				;;
		esac
	fi

	echo $dtype
}
DISTRIBUTION=$(distribution)


# History
HISTFILE=~/.histfile
HISTSIZE=1000
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
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
if [ $EUID -gt 0 ]; then
	autoload -Uz compinit
fi


# zsh plugins
case "$DISTRIBUTION" in
	"manjaro")
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


# Aliases
alias ls='lsd --group-dirs first --date +"%Y-%m-%d %H:%M:%S" --hyperlink auto'
alias ll='ls -l'
alias la='ls -la'
alias cd..='cd ..'
alias ncdu='ncdu --color dark'
alias diskspace='du -Sh | sort -n -r | less'
alias externalip='curl -s https://ringlogic.com/ip/'
alias ufws='sudo ufw status numbered'
alias ip='ip -c'
alias gits='git status'
alias gitd='git diff'
alias gita='git add'
alias gitap='git add -p'
alias gitc='git commit -m'
alias gitp='git push father && git push github'

if [ "$DISTRIBUTION" = "debian" ]; then
	alias cat='batcat --wrap never'
else
	alias cat='bat --wrap never'
fi


# Create and go into the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}


# ll after cd or z
function cd() {
	builtin cd "$@"
	ll
}


# Initialize fzf
if [ "$DISTRIBUTION" = "manjaro" ]; then
	source <(fzf --zsh)
else
	source /usr/share/doc/fzf/examples/key-bindings.zsh
fi


# Initialize Zoxide
eval "$(zoxide init zsh)"
if [ "$DISTRIBUTION" = "manjaro" ]; then
	function z() {
	    __zoxide_z "$@"
	    ll
	}
fi


# Prompts (adapted from https://dotshare.it/dots/590)
setopt prompt_subst
setopt promptsubst
setopt promptpercent

autoload colors; colors;

display_logo() {
	if [[ $EUID == 0 ]]; then
		echo "%{$fg[red]%}\ueb46 %{$reset_color%}"
	else
		case "$DISTRIBUTION" in
			"manjaro")
				echo "%{$fg[green]%} %{$reset_color%}"
				;;
			"debian")
				echo "%{$fg[green]%}\uf306 %{$reset_color%}"
				;;
			*)
				echo "%{$fg[green]%}\uf31a %{$reset_color%}"
		esac
	fi
}
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "─[ %{$fg[yellow]%}${ref#refs/heads/}%{$reset_color%}]"
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

RPROMPT=""
PROMPT="
%B $(display_logo)─┬─[${user_host}%B]─[${current_dir}%B]${git_branch}%(1j.
%B    │ %j background jobs.)%b
%B    ╰─>%(?..%{$fg[red]%})%(?.. [%?])%{$reset_color%}%b "


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi


# Autorun
case "$DISTRIBUTION" in
	"manjaro")
		/usr/bin/cat ~/Images/manjaro-banner.logo
		echo
		fortune -a
		;;
	"debian")
		/home/phil/bin/neofetch
		;;
esac
ll
