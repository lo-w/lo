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
(leaf python-mode
  :init
  (setq python-shell-interprete "python3"))

(defvar python--tools '("python-language-server[all]"
                        "black"
                        "isort")
  "Modules for Python development")

(setq-default python-indent-offset 4
              python-indent-guess-indent-offset-verbose nil)

;; Use black to format the Python code
(leaf blacken
  :hook ((python-mode . blacken-mode)))

;; Sort the pytho imports
(leaf py-isort
  :init (setq python-sort-imports-on-save t))

(provide 'lo-prog)

;;; lo-prog.el ends here
