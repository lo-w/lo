;;; lo-dired.el


(require 'dired-x)

;; set recrusive copy/del by default
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(setq dired-dwin-target 1)

(provide 'lo-dired)
