(require 'org)

;; Store the current file link, then later C-c C-l (org-insert-link) to paste the local link.
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Show latex preview bigger.
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))

;; Be able to change image size.
(setq org-image-actual-width nil)

;; In the latex fragment, cdlatex will complete with tab
;; (use-package cdlatex)
;; (add-hook 'org-mode-hook 'cdlatex-mode)

;; Set agenda file paths.
(setq org-agenda-files (list "~/org/research.org"
                             "~/org/evenings.org"))

;; Key bindings.
(global-set-key (kbd "<f12>") 'org-agenda)

;; Create close timestamp for TODO item.
(setq org-log-done 'time)

;; When hit 80 columns, make a newline.
(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(provide 'setup-org)
