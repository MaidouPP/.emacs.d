;; setup-md.el
;; Copyright (C) 2018  Shixin Li

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
        (setq markdown-command "/usr/bin/pandoc"))

(provide 'setup-md)
