;; org-mode configuration

(require 'org)
;; org-mode code syntax highlight
(setq org-src-fontify-natively t)
;;
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)



(provide 'init-org)
