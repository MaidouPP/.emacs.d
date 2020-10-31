(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/others")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(package-initialize)

;; Use Google emacs support on a corporate machine
(require 'google)
(require 'google-imports)
(require 'google-piper-browse)
(require 'cs)
(global-set-key [f5] #'cs)
;; Shows google logo
(require 'google-logo)
;; To use Google p4 support
(require 'p4-google)
(require 'p4-files)
(p4-enable-file-name-handler)

(load-theme 'tango-dark)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel))
(require 'setup-helm)
;; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;; (require 'setup-cedet)
(require 'setup-editing)
;; (require 'setup-srefac)
(require 'setup-python)
;; (require 'setup-header2)
(require 'setup-sh)
(require 'setup-c)
(require 'setup-md)

;; TODO(shixinli): Move this to another setup elisp file
;; tex-mode
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
;(setq TeX-PDF-mode t)
(put 'downcase-region 'disabled nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flymd auto-complete iedit anzu ws-butler dtrt-indent clean-aindent-mode volatile-highlights helm-swoop zenburn-theme yasnippet-snippets yaml-mode which-key undo-tree tabbar session rust-mode puppet-mode pod-mode muttrc-mode mutt-alias lsp-ui initsplit ido-completing-read+ htmlize graphviz-dot-mode goto-chg gitignore-mode gitconfig-mode gitattributes-mode git-modes folding ess eproject diminish csv-mode company-lsp color-theme-modern browse-kill-ring boxquote bm bar-cursor apache-mode use-package sr-speedbar smartparens nyan-mode)))
