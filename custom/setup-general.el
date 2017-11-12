(menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; ;; company
;; (use-package company
;;   :init
;;   (global-company-mode 1)
;;   (delete 'company-semantic company-backends))
;; ;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; ;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; ;; company
;; (require 'company)
;; (require 'company-c-headers)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8.4/")

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; set sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq sr-speedbar-skip-other-window-p t)
(global-set-key (kbd "<f4>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))

;; highlight paren     
(show-paren-mode 1)

(global-set-key [f6] 'goto-line)

;;水平分割窗口,alt+2
(global-set-key (kbd "M-2") 'split-window-vertically)
;;垂直分割窗口,alt+3
(global-set-key (kbd "M-3") 'split-window-horizontally)

;; 各窗口间切换  
(global-set-key [C-left] 'windmove-left)  
(global-set-key [C-right] 'windmove-right)  
(global-set-key [C-up] 'windmove-up)  
(global-set-key [C-down] 'windmove-down)

;; set shift+tab as buffer switcher
(global-set-key (kbd "<backtab>") #'(lambda ()
                                      (interactive)
                                      (switch-to-buffer (other-buffer (current-buffer) 1))))
(put 'upcase-region 'disabled nil)

;; Package: smartparens
(require 'smartparens)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; ;; when you press RET, the curly braces automatically
;; ;; add another newline
;; (sp-with-modes '(c-mode c++-mode)
;;   (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
;;   (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
;;                                             ("* ||\n[i]" "RET"))))

;; comment                                       
(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)  

(defun my-comment-or-uncomment-region (beg end &optional arg)  
  (interactive (if (use-region-p)  
                   (list (region-beginning) (region-end) nil)  
                 (list (line-beginning-position)  
                       (line-beginning-position 2))))  
  (comment-or-uncomment-region beg end arg)  
  )
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region) 

;; auctex
(load "auctex.el" nil t t)
(load "preview.el" nil t t)
(require 'cdlatex)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;; 设置备份策略
(setq make-backup-files t)
(setq kept-old-versions 2)
(setq kept-new-versions 2)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/.emacsbackup")))

;; Change between horizontal buffer and vertical buffer
(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

(provide 'setup-general)
