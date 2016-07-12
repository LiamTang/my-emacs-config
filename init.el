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
		      ;; --- smex ---
		      ;;smex
		      ;; --- swiper ---
		      swiper
		      counsel
		      smartparens
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

(setq package-selected-packages my/packages)

;; hungry-delete configure
(require 'hungry-delete)
(global-hungry-delete-mode)

;; configure for smex
;;(require 'smex)
;;(global-set-key (kbd "M-x") 'smex)

;; configure for swiper
(require 'swiper)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f1> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f1> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counqsel-ag)
(global-set-key (kbd "C-c l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; configure for smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
;; theme management
(load-theme 'monokai t)

;; turn off tool-bar
(tool-bar-mode -1)

;; turn off scroll-bar
(scroll-bar-mode -1)

;; show line number
(global-linum-mode t) 

;; turn off the start screen
(setq inhibit-splash-screen 1)

;; open the configure file fast
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; bind the function open-init-file to <f2>
(global-set-key (kbd "<f2>") 'open-init-file)

;; open the global-company-mode
(global-company-mode t)

;; change the cursor to bar
;; we need to use setq-default
;; if the varables is buffer-local, setq is only set its
;; local value; and setq-default will set its global value
(setq-default cursor-type 'bar)

;; rencentf-mode open
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-j") 'recentf-open-files)

;; org-mode setting
(require 'org)
;; org-mode code syntax highlight
(setq org-src-fontify-natively t)
;;
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
;; delete-selection-mode
(delete-selection-mode t)

;; highlight matching parentheses
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; highlight the current line
(global-hl-line-mode t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c567c85efdb584afa78a1e45a6ca475f5b55f642dfcd6277050043a568d1ac6f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
