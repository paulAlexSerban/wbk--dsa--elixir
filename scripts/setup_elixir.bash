#!/bin/bash

function install_elixir {
    curl -o ~/install.sh -fsSO https://elixir-lang.org/install.sh
    sh ~/install.sh elixir@1.18.4 otp@27.3.4
}

function add_to_path {
    if ! grep -q 'elixir-install' ~/.bashrc; then
        echo 'export PATH=$HOME/.elixir-install/installs/otp/27.3.4/bin:$PATH' >> ~/.bashrc
        echo 'export PATH=$HOME/.elixir-install/installs/elixir/1.18.4-otp-27/bin:$PATH' >> ~/.bashrc
    fi

    if ! grep -q 'elixir-install' ~/.zshrc; then
        echo 'export PATH=$HOME/.elixir-install/installs/otp/27.3.4/bin:$PATH' >> ~/.zshrc
        echo 'export PATH=$HOME/.elixir-install/installs/elixir/1.18.4-otp-27/bin:$PATH' >> ~/.zshrc
    fi
}

function cleanup {
    rm -f ~/install.sh
}

install_elixir
add_to_path
cleanup