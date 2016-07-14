;; org-mode configuration

(require 'org)
;; org-mode code syntax highlight
(setq org-src-fontify-natively t)

;; org-mode agenda setting
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; org-mode capture setting
(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
	 "* TODO %?\n  %i\n"
	 :empty-lines 1)
	))


(provide 'init-org)
