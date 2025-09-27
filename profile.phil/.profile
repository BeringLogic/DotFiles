export LANG=fr_CA.UTF-8

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="$HOME/.config"

export SSH_AUTH_SOCK="/home/phil/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME=catppuccin-mocha-green-standard+default

export TERMINAL=/sbin/alacritty
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less

export GOPATH="$XDG_DATA_HOME/go"

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export ANDROID_HOME="$HOME/.local/android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export SUDO_PROMPT="$(tput setaf 1 bold)Sudo Password:$(tput sgr0) "

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

