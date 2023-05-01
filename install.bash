platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
fi

if [[ $platform == 'linux' ]]; then
    sudo pacman -S neovim
else
    brew install neovim
fi

npm i -g neovim
