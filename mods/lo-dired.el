;;; lo-dired.el


;; we can using C-x C-j to open current dir
(require 'dired-x)

;; set recrusive copy/del by default
(leaf emacs
  :config
  (setq dired-dwin-target 1
        dired-recursive-copies 1
        dired-recursive-deletes 1)
  (put 'dired-find-alternate-file 'disabled nil))


(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(provide 'lo-dired)
