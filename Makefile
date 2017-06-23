.PHONY : latest stable install

BACKUPDIR=~/dotfiles_backup
DOTFILESDIR=$$(pwd)/dotfiles
INSTALL_DOTFILES=.bash_profile .bashrc .bash_aliases

latest:
	docker build -t aaronpayment/devenv:latest .
stable:
	docker build -t aaronpayment/devenv:stable -t aaronpayment/devenv:latest .
install:
	@mkdir -p ${BACKUPDIR}
	@for entry in ${INSTALL_DOTFILES}; do \
		echo $${entry}; \
		mv -n ~/$${entry} ${BACKUPDIR}/; \
		ln -f -s $$(pwd)/dotfiles/$${entry} ~/$${entry}; \
	done
