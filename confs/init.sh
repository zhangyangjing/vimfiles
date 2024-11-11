#/usr/bin/env sh

echo init link files...
fs='tmux.conf vimrc bashrc bash_profile inputrc gitconfig screenrc ideavimrc gitignore'
for f in $fs
do
    if [ -f ~/.$f ] || [ -L ~/.$f ]
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
    echo ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICNUy4RgUzWcRfdWx8iW61HO4pA6KmT4c4L1fx+2sbEK zhangyangjing@gmail.com >> ~/.ssh/authorized_keys
fi
