#/usr/bin/env sh

echo init link files...
fs='tmux.conf vimrc bashrc bash_profile inputrc gitconfig screenrc'
for f in $fs
do
    if [ -s ~/.$f ]
    then
        read -p "$HOME/.$f exists, delete it? (y/n):"

        if [ y = $REPLY ]; then
            rm ~/.$f
        elif [ n = $REPLY ]; then
            continue
        else
            echo invalid argument
            continue
        fi
    fi

    ln -s `pwd`/$f ~/.$f
done

echo add pub-key...
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    chmod 700 ~/.ssh
fi
if [ ! -d ~/.ssh/authorized_keys ]; then
    touch ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
fi
if [ `cat ~/.ssh/authorized_keys | grep zhangyangjing@gmail.com | wc -l` -eq 0 ]; then
    echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjqo1BsM/UfDg35y6nydEbjVF/Y0LflBjUjzAZphi/u00wX9PloX/p6ahc57kZLgXLVVllfcBOT4nvMdoMcf1LfPt9T8Gn97lvtoxBJpat5q9W8lZGl1g+/g9ZpTe4AfapwJlZJIJ64NSuCdRPh0SanDQM5JXntOWMk0Xz8JLdHfNEjirNdn2d/6/qsTNQguq7jWUQZQIj2QIw79HoqFvsry3bMfYA/kobYN17Sgr27nMD7f4+yZm/0OnscmCWP9+m6QvbEbQR8rqZ3daIg+A7p+aa7zFedRaHE94CdpOPKadq76eF/xxrA9IF9PH7GSMa/zElMJ/onDYcLKDAmird zhangyangjing@gmail.com >> ~/.ssh/authorized_keys
fi
