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
		      ;; evil
		      evil
		      evil-leader
		      window-numbering
		      ;;powerline
		      evil-nerd-commenter
		      evil-surround
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

;; visual-line-mode setting
;; something to be set future: how to make it wrap at given column
(global-visual-line-mode)

;; evil setting
(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-leader: a evil plugin 
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file)

;; evil-surround setting
;; in the evil-visual-state, use S to add surround near the selected textobject
;; use gS to concel the surround
;; use cs to change
;; for more details, reference the official documents.
;; https://github.com/timcharper/evil-surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; evil-nerd-commenter setting
;; evil-nerd-commenter can be used without evil
;; Emacs key bindings
;;(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
;; (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
;;(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
;; (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; Vim key bindings
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
)


;; window-numbering setting
;; this packapge is used to convinence the switch between the window
;; if not use this, we can switch window by these ways:
;; in evil normal state: C-w h/j/k/l
;; in evil emacs state or evil insert state: C-x o
;; after active this mode, we can use M-windownumber to switch
(window-numbering-mode 1)

;; powerline setting
;;(powerline-center-theme)

(provide 'init-packages)
