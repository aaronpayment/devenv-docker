.PHONY : all alpha install

BACKUPDIR=~/dotfiles_backup
DOTFILESDIR=$$(pwd)/dotfiles
INSTALL_DOTFILES=.bash_profile .bashrc .bash_aliases
all:
	docker build -t aaronpayment/devenv:latest .
alpha:
	docker build -t aaronpayment/devenv:alpha -t aaronpayment/devenv:latest .
install:
	@mkdir -p ${BACKUPDIR}
	@for entry in ${INSTALL_DOTFILES}; do \
		echo $${entry}; \
		mv -n ~/$${entry} ${BACKUPDIR}/; \
		ln -f -s $$(pwd)/dotfiles/$${entry} ~/$${entry}; \
	done
