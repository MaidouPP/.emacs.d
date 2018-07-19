;; === General Configuration
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

;; use-package list
(use-package smartparens)
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))
(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

;; indentation
(setq-default c-basic-offset 4)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "linux") ;; set style to "linux"

;; Parens indentation
(defun my-create-newline-and-allman-format (&rest _ignored)
  "Allman-style formatting for C."
  (interactive)
  (progn
    (previous-line) (search-forward "{") (newline-and-indent)
    (indent-according-to-mode)))

;; (sp-local-pair '(c-mode) "{" nil :post-handlers '((my-create-newline-and-allman-format "RET")))
;; (sp-local-pair '(c++-mode) "{" nil :post-handlers '((my-create-newline-and-allman-format "RET")))

;; cpputils-cmake
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (if (derived-mode-p 'c-mode 'c++-mode)
;;                 (cppcm-reload-all)
;;               )))

;; (require 'ede)
;; (global-ede-mode)

(provide 'setup-c)
