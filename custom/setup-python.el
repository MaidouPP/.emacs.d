(require 'elpy)
(elpy-enable)

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (require 'auto-complete)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PYTHONPATH")

;; (add-hook 'python-mode-hook 'semantic-mode)
(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
(add-hook 'python-mode-hook (lambda ()
                              (guess-style-guess-tab-width)))
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; (add-hook 'python-mode-hook 'run-python)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
(global-set-key (kbd "M-.") 'jedi:goto-definition)
(global-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)

(auto-insert-mode) ;;; Adds hook to find-files-hook
(setq auto-insert-directory "~/.emacs.d/template/") ;;; Or use custom, *NOTE* Trailing slash important
(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(setq auto-insert-alist
      (append '(
                (python-mode . "python_template.py")
                )
              auto-insert-alist))

(setq company-global-modes '(not python-mode))

;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'setup-python)
