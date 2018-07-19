(elpy-enable)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PYTHONPATH")

;; (add-hook 'python-mode-hook 'semantic-mode)
;; (add-hook 'python-mode-hook (lambda ()
;;                              (guess-style-guess-tab-width)))

(use-package flymake-mode)
(use-package pyvenv-mode)
;; (use-package yas-minor-mode)

(defun my-elpy-mode-config ()
  "For use in `elpy-mode-hook'."
  (add-hook 'elpy-mode-hook (lambda () (flymake-mode 0)))
  (add-hook 'elpy-mode-hook (lambda () (pyvenv-mode 0)))
  (add-hook 'elpy-mode-hook (lambda () (yas-minor-mode 0)))
  (local-set-key (kbd "M-.") 'elpy-goto-definition)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  )

;; add to hook
(add-hook 'python-mode-hook 'my-elpy-mode-config)

(auto-insert-mode) ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/template/") ;;; Or use custom, *NOTE* Trailing slash important
(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(setq auto-insert-alist
      (append '(
                (python-mode . "python_template.py")
                )
              auto-insert-alist))

;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'setup-python)
