;; entry of the configuration

(add-to-list 'load-path "~/.emacs.d/lisp/")


;; open the configure file fast
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-key-binding)
(require 'init-org)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file)
