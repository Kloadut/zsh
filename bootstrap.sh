#!/usr/bin/env sh

endpath="$HOME/.kload-zsh"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

# Backup existing .vim stuff
echo "backing up current kload config\n"
today=`date +%Y%m%d`
for i in $HOME/.zshrc $HOME/.oh-my-zsh $endpath; do [ -e $i ] && mv $i $i.$today; done

echo "installing oh-my-zsh"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "cloning kload-vim\n"
git clone --recursive http://github.com/Kloadut/zsh.git $endpath
rm $HOME/.zshrc
ln -s $endpath/.zshrc $HOME/.zshrc

chsh -s /bin/zsh

echo "Done\n"
