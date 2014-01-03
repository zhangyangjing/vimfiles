#!bash

#
# about ssh connect
#
function server {
    if [ $# -eq 1 ]
    then
        _connect $1
    fi
}

_connect() {
    case "$1" in
        "linode")
            ssh zyj@106.187.37.180;;
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
            echo bad host name
            echo "  linode"
            echo "  100"
            echo "  gs"
            echo "  178"
            echo "  179"
            echo "  180";;
    esac
}


# translate man help page to pdf format, only for MAC
function man2pdf {
    man -t $1 | open -f -a /Applications/Preview.app
}
