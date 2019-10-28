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

;; Be able to change image size
(setq org-image-actual-width nil)

;; In the latex fragment, cdlatex will complete with tab
(use-package cdlatex)
(add-hook 'org-mode-hook 'cdlatex-mode)

;; Use org jekyll mode to generate jekyll compatible html files
(defun org-jekyll-head ()
  (beginning-of-buffer)
  (let (title (file-name-base (buffer-file-name))))
  (insert (concat "#+startup: showall\n"
                  "#+options: toc:nil\n"
                  "#+begin_export html\n"
                  "---\n"
                  "layout     : post\n"
                  "title      : " (file-name-base (buffer-file-name)) "\n"
                  "categories : \n"
                  "tags       : \n"))
  (goto-char (point-max))
  (newline)
  (insert (concat "---\n"
                  "#+end_export\n"
                  "#+TOC: headlines 2\n"))
  (goto-char (point-min)))
(define-key global-map "\C-c j h" 'org-jekyll-head)

(provide 'setup-org)
