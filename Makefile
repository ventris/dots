DOTFILES=$(pwd)

all: \
	git \
	brew \
	defaults \
	dotfiles \
	vim \
	zsh \
	kubectl \
	python3 \
	ssh \
	tmux \
	keyboard-layout


vim: \
	vim-dirs \
	vim-plugins \
	vim-color

vim-dirs:
	# create vim directories
	mkdir -p ~/.vim/tmp/{backup,swap,undo}


vim-plugins: \
	# Install Vim plugins
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# disable colorscheme for installing plugins to a temporary .vimrc
	sed 's/colorscheme/"colorscheme/' .vimrc > /tmp/.vimrc
	# install plugins with temporary vimrc
	vim -u /tmp/.vimrc +PlugInstall
	-rm /tmp/.vimrc
	# post installation steps of command-t (use the ruby that ships with vim)
	cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && /usr/local/opt/ruby/bin/ruby extconf.rb && make


vim-color: \
	# Install Vim colors
	mkdir -p ~/.vim/colors
	git clone https://github.com/chriskempson/tomorrow-theme.git ~/.vim/colors/tomorrow-theme
	cp ~/.vim/colors/tomorrow-theme/vim/colors/*.vim ~/.vim/colors/


zsh: \
	# Upgrade oh-my-zsh if possible
	./upgrade_oh_my_zsh
	# Install Oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	chsh -s /usr/local/bin/zsh
	git clone https://github.com/ventris/typo ~/.oh-my-zsh/custom/themes/typo
	ln -s ~/.oh-my-zsh/custom/themes/typo/typo.zsh-theme ~/.oh-my-zsh/custom/themes/typo.zsh-theme


brew: \
	brew-install
	bash ./brew.sh


brew-install:
	xcode-select --install
	ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew analytics off


defaults: \
		bash ./defaults.sh


dotfiles: \
	# Rsync out the dotfiles
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".defaults.sh" \
		--exclude ".brew.sh" \
		--exclude ".Makefile" \
		--exclude ".gitconfig-work" \
		--exclude "bin/" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;


kubectl:
	kubectl completion bash > ~/.kube/bash_completion


python3: \
	# Install python packages
	pip3 install --upgrade pip setuptools wheel
	pip3 install --user --upgrade awscli
	pip3 install pylint
	pip3 install hvac
	pip3 install ansible
	pipx ensurepath


ssh: \
	# Create directories for ssh
	mkdir -p ~/.ssh/control
	mkdir -p ~/.ssh/config.d


git: \
	#Create git directories
	mkdir -p ~/wcode
	mkdir -p ~/code
	cp ${DOTFILES}/.gitconfig-work ~/wcode/.gitconfig


tmux: \
	# Install tmuxp
	pipx install --force tmuxp
	# Install tpm
	mkdir -p ~/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

keyboard-layout: \
	# Add keyboard layout to system
	cp ${DOTFILES}/wonderful.keylayout /Library/Keyboard\ Layouts/wonderful.keylayout
