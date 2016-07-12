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

;; open the global-company-mode
(global-company-mode t)

;; configure for swiper
;;(require 'swiper)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; hungry-delete configure
;;(require 'hungry-delete)
(global-hungry-delete-mode)

;; configure for smartparens
(smartparens-global-mode t)

;; configure for popwin
(require 'popwin)
(popwin-mode 1)

;; theme management
(load-theme 'monokai t)




(provide 'init-packages)
