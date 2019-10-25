;;; setup-org.el ---                                 -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Shixin Li

;; Author: Shixin Li <shixinli@shixin.mtv.corp.google.com>
;; Keywords: abbrev,

(require 'org)
(use-package org-ref)

;; C-M i completion on org symbols
;; (setq completion-at-point-functions
;;       '(org-completion-symbols
;;         ora-cap-filesystem
;;         org-completion-refs))

;; Show latex preview bigger
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))

;; In the latex fragment, cdlatex will complete with tab
(use-package cdlatex)
(add-hook 'org-mode-hook 'cdlatex-mode)

(provide 'setup-org)
