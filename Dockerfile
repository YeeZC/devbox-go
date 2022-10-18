FROM ubuntu:latest
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates curl zsh git wget && chsh -s /bin/zsh
RUN mkdir /workspace && wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ADD "https://studygolang.com/dl/golang/go1.18.7.linux-amd64.tar.gz" go1.18.7.linux-amd64.tar.gz
ADD .zshrc ~/.zshrc
RUN tar zxvf go1.18.7.linux-amd64.tar.gz -C /usr/ && ln -s /usr/go/bin/* /usr/bin/
ADD main.go main.go
RUN go build -o /usr/bin/devbox main.go
RUN rm -rf main.go && rm -rf go1.18.7.linux-amd64.tar.gz
EXPOSE 8089
WORKDIR /workspace
VOLUME [ "/workspace" ]
CMD ["/usr/bin/devbox"]
