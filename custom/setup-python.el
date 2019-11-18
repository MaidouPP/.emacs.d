;; Google format
(require 'google-pyformat)

;; Automatically format
(add-hook 'python-mode-hook
          (lambda ()
            (unless (derived-mode-p 'google3-build-mode)
              (add-hook 'before-save-hook 'google-pyformat nil t))))

(provide 'setup-python)
