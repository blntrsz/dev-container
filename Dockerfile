FROM alpine:edge

RUN apk add \
  zsh \
  git \
  nodejs \
  neovim \
  ripgrep \
  alpine-sdk \
  tmux \
  openssh \
  --update

RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'

RUN mkdir ~/p
WORKDIR /root/p

COPY .gitconfig /root

