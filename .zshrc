export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting	
)
source $ZSH/oh-my-zsh.sh
export GOPATH=/workspace           
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct
export GOSUMDB=sum.golang.google.cn
