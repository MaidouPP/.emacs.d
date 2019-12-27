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
(require 'cs)
(global-set-key [f5] #'cs)
;; Shows google logo
(require 'google-logo)
;; To use Google p4 support
(require 'p4-google)
(require 'p4-files)
(p4-enable-file-name-handler)

(load-theme 'tango-dark)
;; (load-theme 'zenburn t)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(initial-frame-alist (quote ((fullscreen . maximized))))
;;  '(package-selected-packages
;;    (quote
;;     (company-capf helm-core protobuf-mode irony projectile flymd markdown markdown-mode+ markdown-mode irony-mode company-irony cpputils-cmake cmake-mode company-c-headers smartparens auto-complete elpy pyvenv srefactor iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights helm-gtags helm-projectile helm-swoop helm sr-speedbar zygospore nyan-mode use-package)))
;;  '(send-mail-function (quote mailclient-send-it))
;;  '(zoom-mode t nil (zoom)))
;;  ;; start maximized

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
