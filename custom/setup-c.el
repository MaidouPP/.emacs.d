;; === General Configuration
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

(use-package irony
  :config
  (progn
    ;; If irony server was never installed, install it.
    (unless (irony--find-server-executable) (call-interactively #'irony-install-server))
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    ))

(use-package smartparens)

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony)
  (setq company-idle-delay 0.2)
  (setq company-backends '((company-irony)))
  )

(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

;; Parens indentation
(defun my-create-newline-and-allman-format (&rest _ignored)
  "Allman-style formatting for C."
  (interactive)
  (progn
    (previous-line) (search-forward "{") (newline-and-indent)
    (indent-according-to-mode)))

(sp-local-pair '(c-mode) "{" nil :post-handlers '((my-create-newline-and-allman-format "RET")))
(sp-local-pair '(c++-mode) "{" nil :post-handlers '((my-create-newline-and-allman-format "RET")))

(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

;; Google C-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(provide 'setup-c)
