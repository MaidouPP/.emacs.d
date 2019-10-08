(require 'cc-mode)
(require 'semantic)

;; (global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

;; (semantic-mode 1)

(semantic-add-system-include "/usr/include")

(defun shixin/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'shixin/cedet-hook)
(add-hook 'c-mode-hook 'shixin/cedet-hook)
(add-hook 'c++-mode-hook 'shixin/cedet-hook)

(defun my-inhibit-semantic-p ()
  (equal major-mode 'python-mode))

(with-eval-after-load 'semantic
  (add-to-list 'semantic-inhibit-functions 'my-inhibit-semantic-p))

(provide 'setup-cedet)
