;;; package --- init file for emacs
;;; Code:
;;; Commentary:
;;; init.el

(defvar lo-dir (file-name-directory load-file-name))
(defvar lo-core (expand-file-name "core" lo-dir))
(add-to-list 'load-path lo-core)

(require 'const)
(require 'init-start)
(require 'init-edit)
(require 'init-pkgs)
(require 'init-kbds)
;(require 'init-ui)

(when *win* (require 'lo-win))
(when *lin* (require 'lo-lin))
(when *mac* (require 'lo-mac))

;;; init.el ends here
