;; General Configuration
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

;; CiderLSP for IDE features
(require 'google3-eglot)
(customize-set-variable google3-eglot-c++-server 'clangd)
(google3-eglot-setup)

;; Company mode is for **dynamic** auto-completion
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends 'company-capf))

;; Enable BUILD file completion
(google3-build-capf-enable-completions)

;; Collections of snippets for Google specific codes
(require 'google-yasnippets)
(google-yasnippets-load)

;; Smart parens
(use-package smartparens)

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

(provide 'setup-c)
