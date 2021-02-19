;; const
(defconst *mac* (eq system-type 'darwin))
(defconst *linux* (eq system-type 'gnu/linux))
(defconst *windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(defvar lo-dir (file-name-directory load-file-name))
(defvar lo-core (expand-file-name "core" lo-dir))
(defvar lo-modules (expand-file-name "modules" lo-dir))



(provide 'const)
