
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)
(require 'init-ui)



(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-load-library)
;;(global-set-key (kbd "<f1> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f1> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counqsel-ag)
;;(global-set-key (kbd "C-c l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)





;; open the configure file fast
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; bind the function open-init-file to <f2>
(global-set-key (kbd "<f2>") 'open-init-file)





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



;; auto load files changed outside the emacs
(global-auto-revert-mode t)

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

;; key binding
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)
