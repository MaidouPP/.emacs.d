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

(use-package flymd
  :init  (defun my-flymd-browser-function (url)
           (let ((browse-url-browser-function 'browse-url-firefox))
             (browse-url url)))
         (setq flymd-browser-open-function 'my-flymd-browser-function))

(provide 'setup-md)
