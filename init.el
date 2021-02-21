;; init file

(defvar lo-dir (file-name-directory load-file-name))
(defvar lo-core (expand-file-name "core" lo-dir))
(defvar lo-mods (expand-file-name "mods" lo-dir))

(add-to-list 'load-path lo-core)
(add-to-list 'load-path lo-mods)

(require 'const)
(require 'init-start)
(require 'init-edit)
(require 'init-repo)
(require 'init-pkgs)
(require 'init-kbd)
(require 'init-ui)

(when *mac* (require 'lo-mac))
(when *linux* (require 'lo-linux))
(when *windows* (require 'lo-win))
