;; add solarized color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(setq solarized-termcolors 16)
(set-terminal-parameter nil 'background-mode 'dark)
