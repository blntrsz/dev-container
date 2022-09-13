FROM ubuntu

# install
RUN apt update -y && apt upgrade -y
RUN apt-get install -y \
    git \
    zsh \
    make \
    build-essential \
    ninja-build \
    gettext \
    libtool  \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    curl \
    stow

# install neovim
RUN git clone https://github.com/neovim/neovim.git
RUN cd neovim && make -j 20
RUN cd neovim && make install

RUN useradd -ms /bin/zsh balint
RUN chown -R balint:balint /home/balint
USER balint
WORKDIR /home/balint

# dotfiles
RUN git clone https://github.com/blntrsz/.dotfiles.git ~/.dotfiles

RUN mkdir -p ~/.local/share/nvim/site/pack/packer/start

RUN git clone https://github.com/wbthomason/packer.nvim > ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN cd .dotfiles && bash setup

# RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'