;;; prog --- prog
;;; Code:
;;; Commentary:
;;; lo-prog.el


(leaf js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(leaf go-mode)
(leaf yaml-mode)


(provide 'lo-prog)

;;; lo-prog.el ends here
