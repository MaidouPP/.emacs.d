(add-hook 'sh-mode-hook 'auto-complete-mode)

(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/template/")

(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
(setq auto-insert-alist
      (append '(
                (sh-mode . "sh_template.sh")
                )
              auto-insert-alist))

(provide 'setup-sh)
