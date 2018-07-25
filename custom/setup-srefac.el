(use-package srefactor
  :init
  ;; (use-package srefactor-lisp)

  ;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++.
  (semantic-mode 1) ;; -> this is optional for Lisp

  (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
  (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
  (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
  (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)
  )

(provide 'setup-srefac)
