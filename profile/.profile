export LANG=fr_CA.UTF-8

export XDG_CONFIG_DIRS="$HOME/.config"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME=catppuccin-mocha-green-standard+default

export TERMINAL=/usr/bin/ghostty
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less

export GOPATH="$XDG_DATA_HOME/go"

export JAVA_HOME=/usr/lib/jvm/java-24-openjdk
export ANDROID_HOME="/opt/android-sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

