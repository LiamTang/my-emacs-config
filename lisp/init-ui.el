;; Configuration for Emacs User Interface

;; turn off tool-bar
(tool-bar-mode -1)

;; turn off scroll-bar
(scroll-bar-mode -1)

;; show line number
;;(global-linum-mode t) 
(add-hook 'prog-mode-hook 'linum-mode)

;; turn off the start screen
(setq inhibit-splash-screen 1)

;; change the cursor to bar
;; we need to use setq-default
;; if the varables is buffer-local, setq is only set its
;; local value; and setq-default will set its global value
(setq-default cursor-type 'bar)

;; highlight the current line
(global-hl-line-mode t)

(provide 'init-ui)
