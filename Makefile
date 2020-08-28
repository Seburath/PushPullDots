ubuntu: ubuntu-install common

arch: arch-install common

ubuntu-install:
	apt-get update

	apt-get install \
	  	vim \
		zsh \
		terminator \
		git \
		python3 \
		python3-pip \
		curl \
		snap

	snap install \
	  	hub

arch-install:
	sudo pacman -S \
		zsh \
		terminator \
		git \
		python3 \
		python-pip \
		fzf \
		curl
		#hub

	ln -s -f `pwd`/config/terminator/ ~/.config/terminator/
	ln -s -f `pwd`/config/xfce4/ ~/.config/xfce4/

common:
	#vim-plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	#oh-myzsh
	rm -rf ~/.oh-my-zsh
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	
	ln -s -f `pwd`/zshrc ~/.zshrc
	ln -s -f `pwd`/vimrc ~/.vimrc
	ln -s -f `pwd`/oh-my-zsh/ ~/.oh-my-zsh/

push:
	git add *
	git commit -m 'update'
	git push


.PHONY: ubntu arch ubuntu-install arch-install common push
