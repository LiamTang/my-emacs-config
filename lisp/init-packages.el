;; Package management

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Package
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Hungry-delete ---
		      hungry-delete
		      ;; --- swiper ---
		      swiper
		      counsel
		      ;;
		      smartparens
		      ;; --- popwin---
		      popwin

		      ;; -- some program major-mode
		      web-mode

		      ;;
		      expand-region
		      ;;
		      iedit
		      ;;
		      org-pomodoro
		      ;;
		      flycheck
		      ;;
		      yasnippet
		      auto-yasnippet
		      ;; search and replaces (need installed ag first)
		      helm-ag
		      ;; --- Themes ---
		      monokai-theme
		     ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; config prog-mode to replace the default
(setq auto-mode-alist
      (append
       '(
	 ("\\.html\\'" . web-mode)
	 )
       auto-mode-alist))

;; open the global-company-mode
(global-company-mode t)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; configure for swiper
;;(require 'swiper)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; hungry-delete configure
;;(require 'hungry-delete)
(global-hungry-delete-mode)

;; configure for smartparens
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; configure for popwin
(require 'popwin)
(popwin-mode 1)

;; configuration for expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; theme management
(load-theme 'monokai t)

;; helm-ag setting
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; flycheck setting

;; yasnippet setting
(yas-global-mode t)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
