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

(require 'go-mode-autoloads)
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  ;(setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)
