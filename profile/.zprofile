export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_THEME=catppuccin-mocha-green-standard+default

export TERMINAL=/usr/bin/ghostty
export EDITOR=/usr/bin/nvim
export PAGER=/usr/bin/less

export GOPATH="$XDG_DATA_HOME/go"

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export ANDROID_HOME="$HOME/.local/android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

