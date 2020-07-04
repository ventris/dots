#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;


# Install `wget` with IRI support.
brew install wget --with-iri

# TAPS
brew tap homebrew/cask
brew tap homebrew/cask-eid
brew tap homebrew/cask-drivers
brew tap caskroom/versions



# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install gmp

# Languages
brew install python # Now defaults to python 3
brew install go

# Dev tools
brew install gcc # Can take FOREVER (~1 hour)
brew install git
brew install ctags
brew install gradle
brew install pgcli
brew install jq

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-fontawesome


# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install zsh
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli
brew install httpie
brew install trash
brew install kubectl
brew install docker-compose
brew install vault
brew install gnu-tar
brew install geoip
brew install tmate
brew install tmux
brew install reattach-to-user-namespace
brew install pipx
brew install gawk
brew install mitmproxy
brew install ctop
brew install speedtest_cli
brew install calc
brew install unar
brew

# TIling window manager
brew install amethyst


# BREW CASK
brew cask install 1password
brew cask install 1password-cli
brew cask install slack
brew cask install iterm2
brew cask install firefox
brew cask install google-chrome
brew cask install gpg-suite
brew cask install karabiner-elements
brew cask install keepingyouawake
brew cask install wireshark
brew cask install postman
brew cask install insomnia
brew cask install docker
brew cask install vlc
brew cask install zoomus
brew cask install Vagrant/Virtualbox
brew cask install vagrant
brew cask install vagrant-manager
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install visual-studio-code
brew cask install there
brew cask install mysqlworkbench

# Remove outdated versions from the cellar.
brew cleanup -s
brew doctor
