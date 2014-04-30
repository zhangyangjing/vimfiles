#!bash

function src_count {
    type=$1
    total=0
    for x in `find ./* -type f -name "*.$type"`;
    do
        single=`cat $x|wc -l`
        total=$total+$single
    done

    echo $total|bc
}

#
# about ssh connect
#
function server {
    if [ $# -eq 1 ]
    then
        _connect $1
    else
        _show_server_help
    fi
}

_connect() {
    case "$1" in
        "home")
            ssh zyj@192.168.1.100;;
        "homehome")
            ssh zyj@home.zhangyangjing.com;;
        "linode")
            ssh zyj@128.199.192.171;;
        "100")
            ssh zyj@10.0.0.100;;
        "gs")
            ssh zyj@intra.enjoystudy.com -p18000;;
        "178")
            ssh zyj@211.151.127.178;;
        "179")
            ssh zyj@211.151.127.179;;
        "180")
            ssh zyj@211.151.127.180;;
        *)
            _show_server_help;;
    esac
}

_show_server_help() {
    echo bad host name
    echo "  linode"
    echo "  100"
    echo "  gs"
    echo "  178"
    echo "  179"
    echo "  180"
}


# translate man help page to pdf format, only for MAC
function man2pdf {
    man -t $1 | open -f -a /Applications/Preview.app
}

# exports
export PATH=/Users/zhangyangjing/Applications/adt-bundle-mac-x86_64-20131030/sdk/tools:$PATH
export PATH=/Users/zhangyangjing/Applications/adt-bundle-mac-x86_64-20131030/sdk/build-tools/android-4.4:$PATH
export PATH=/Users/zhangyangjing/Applications/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:$PATH

# tmux
[[ -s "$HOME/.pythonbrew/etc/bashrc"  ]] && source "$HOME/.pythonbrew/etc/bashrc"
