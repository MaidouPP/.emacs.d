(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

;; THE FAMOUS RAINBOW CAT!!!!!!!
(use-package nyan-mode
  :init
  (nyan-mode 1))

;; simplify the answer
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
(use-package sr-speedbar
  :init
  (setq sr-speedbar-right-side nil)
  (setq sr-speedbar-width 25)
  (setq sr-speedbar-skip-other-window-p t)
  (global-set-key (kbd "<f4>") (lambda()
                                 (interactive)
                                 (sr-speedbar-toggle))))

;; highlight paren     
(show-paren-mode 1)

(global-set-key [f6] 'goto-line)

;; horizontal split
(global-set-key (kbd "M-2") 'split-window-vertically)
;; vertical split
(global-set-key (kbd "M-3") 'split-window-horizontally)

;; switch between windows
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
(use-package smartparens)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

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

(recentf-mode 1)
(setq recentf-max-menu-items 40)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; ;;; set backup strategy
;; (setq make-backup-files t)
;; (setq kept-old-versions 2)
;; (setq kept-new-versions 2)
;; (setq delete-old-versions t)
;; (setq backup-directory-alist '(("" . "~/.emacsbackup")))

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

;; Save whatever’s in the current (system) clipboard before
;; replacing it with the Emacs’ text.
;; https://github.com/dakrone/eos/blob/master/eos.org
(setq save-interprogram-paste-before-kill t)

;; Select Text between Quotes/Brackets
(defun xah-select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
Delimiters here includes the following chars: \"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
This command select between any bracket chars, not the inner text of a bracket. For example, if text is

 (a(b)c▮)

 the selected char is “c”, not “a(b)c”.

URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2016-12-18"
  (interactive)
  (let (
        ($skipChars
         (if (boundp 'xah-brackets)
             (concat "^\"" xah-brackets)
           "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）"))
        $pos
        )
    (skip-chars-backward $skipChars)
    (setq $pos (point))
    (skip-chars-forward $skipChars)
    (set-mark $pos)))

(global-set-key (kbd "C-x C-SPC") 'xah-select-text-in-quote)

(unless (display-graphic-p)
  (setq linum-format "%d "))

;; Google C-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'column-marker)
(add-hook 'c-mode-common-hook (lambda () (interactive) (column-marker-1 80)))

;; Zoom mode
(require 'zoom)
(custom-set-variables '(zoom-mode t))

(provide 'setup-general)
