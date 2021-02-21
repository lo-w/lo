;; const
(defconst *mac* (eq system-type 'darwin))
(defconst *linux* (eq system-type 'gnu/linux))
(defconst *windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(provide 'const)
