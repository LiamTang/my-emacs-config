;; Some Other Configuration

;; close the waring ring
(setq ring-bell-function 'ignore)

;; highlight matching parentheses
(defun my-show-paren-function (orig-fun &rest args)
  "Highlight enclosing parens"
  (cond ((looking-at-p "\\s(") (apply orig-fun args))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (apply orig-fun args))))
 )

(advice-add 'show-paren-function :around #'my-show-paren-function)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; rencentf-mode open
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-c C-j") 'recentf-open-files)

;; auto load files changed outside the emacs
(global-auto-revert-mode t)

;; delete-selection-mode
(delete-selection-mode t)

;; 代码缩进
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region"))
      (progn
	(indent-buffer)
	(message "Indent Buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;; 配置dired mode
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-recursive-copies 'always)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; 配置dired-x
(require 'dired-x)
(setq dired-dwim-target 1)

;; improve occur to capture the string uder cursor
(defun my-occur-capture ()
  "Call occure with a sane default"
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	  (when (stringp sym)
	    (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'my-occur-capture)

;; improve imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)
;;
(auto-image-file-mode t)
(provide 'init-better-defaults)
