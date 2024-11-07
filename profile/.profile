# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

export QT_QPA_PLATFORMTHEME="qt5ct"

export TERMINAL=/usr/bin/alacritty
export EDITOR=/usr/bin/micro
export PAGER=/usr/bin/less

export NNN_OPTS="r"
export NNN_COLORS="4"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)\$"
export NNN_BMS='D:~/Data;d:~/Documents;i:~/Images;t:~/Téléchargements;j:~/Jeux'
export NNN_PLUG='c:chksum;d:dragndrop;g:getplugs;m:-_mount $nnn*;u:-_umount $nnn*;'
