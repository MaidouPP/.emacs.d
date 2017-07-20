(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(semantic-add-system-include "/usr/local/include")
(semantic-add-system-include "/usr/include")
(semantic-add-system-include "/usr/include/c++/4.8")
(semantic-add-system-include "/usr/include/c++/4.8.4")

(defun shixin/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'shixin/cedet-hook)
(add-hook 'c-mode-hook 'shixin/cedet-hook)
(add-hook 'c++-mode-hook 'shixin/cedet-hook)
(add-hook 'python-mode-hook 'semantic-mode)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'setup-cedet)
