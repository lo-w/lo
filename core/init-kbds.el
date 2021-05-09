;;; kbds --- kbds
;;; Code:
;;; Commentary:
;;; init-kbds.el

(fset 'yes-or-no-p 'y-or-n-p)

;; global key-binding settings for comment (jetbrains style)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-?") 'comment-or-uncomment-region)

(leaf crux
  :bind
  (("C-a" . crux-move-beginning-of-line)
   ("C-<backspace>" . crux-kill-line-backwards)
   ("C-x ," . crux-find-user-init-file)
   ("C-c s" . crux-swap-windows)
   ("C-c k" . crux-smart-kill-line)))

(leaf hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward)
         ("C-c d" . hungry-delete-forward)))

(leaf drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

(provide 'init-kbds)

;;; init-kbds.el ends here
