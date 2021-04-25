;;; prog --- prog
;;; Code:
;;; Commentary:
;;; lo-prog.el

;; for edit
(leaf yaml-mode)
(leaf json-mode)
;; (leaf xml-mode)

;; for language
;; js
(leaf js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'"    . js2-mode))
(add-to-list 'auto-mode-alist '("\\.pac\\'"   . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; go
(leaf go-mode)

;; jave
;; (leaf java-mode)

;; python
;; (leaf python-mode)

(provide 'lo-prog)

;;; lo-prog.el ends here
