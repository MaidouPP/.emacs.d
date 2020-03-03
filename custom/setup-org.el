(require 'org)

;; Show latex preview bigger
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))

;; Be able to change image size
(setq org-image-actual-width nil)

;; In the latex fragment, cdlatex will complete with tab
;; (use-package cdlatex)
;; (add-hook 'org-mode-hook 'cdlatex-mode)

;; Be able to change image size
(setq org-image-actual-width nil)


(provide 'setup-org)
