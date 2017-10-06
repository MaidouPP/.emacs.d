(require 'elpy)
(elpy-enable)

;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))
(require 'auto-complete)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PYTHONPATH")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; (add-hook 'python-mode-hook 'run-python)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
(global-set-key (kbd "M-.") 'jedi:goto-definition)
(global-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker)

(provide 'setup-python)
