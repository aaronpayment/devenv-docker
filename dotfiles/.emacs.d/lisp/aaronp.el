(menu-bar-mode -1)
(setq backup-inhibited t)
(setq auto-save-default nil)

(show-paren-mode 1)
(global-hl-line-mode 1)
(transient-mark-mode t)

;; extra key bindings
(global-set-key [ ( meta g ) ] 'goto-line)
(global-set-key (kbd "C-x <left>") 'windmove-left)          ; move to left windnow
(global-set-key (kbd "C-x <right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "C-x <up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "C-x <down>") 'windmove-down)          ; move to down window
