;;; kbds


(fset 'yes-or-no-p 'y-or-n-p)

(leaf crux
  :bind
  (("C-a" . crux-move-beginning-of-line)
   ("C-<backspace>" . crux-kill-line-backwards)
   ("C-x ," . crux-find-user-init-file)
   ("C-c k" . crux-smart-kill-line)))

(leaf hungry-delete
  :bind (("C-c DEL" . hungry-delete-backward)
         ("C-c d" . hungry-delete-forward)))

(leaf drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

(provide 'init-kbds)
