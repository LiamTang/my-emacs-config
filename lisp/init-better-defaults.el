;; Some Other Configuration

;; close the waring ring
(setq ring-bell-function 'ignore)

;; highlight matching parentheses
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; rencentf-mode open
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-j") 'recentf-open-files)

;; auto load files changed outside the emacs
(global-auto-revert-mode t)

;; delete-selection-mode
(delete-selection-mode t)

(provide 'init-better-defaults)
