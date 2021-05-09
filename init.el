;;; package --- init file for emacs
;;; Code:
;;; Commentary:
;;; init.el

(defvar lo-dumped nil)
(defvar lo-dir (file-name-directory load-file-name))
(defvar lo-core (expand-file-name "core" lo-dir))
(add-to-list 'load-path lo-core)

(require 'const)

(if lo-dumped
  (progn 
    (setq load-path lo-dumped-load-path)
    (add-to-list 'load-path lo-core)
    (lo-dump))
  (lo-init))

(when *win* (require 'lo-win))
(when *lin* (require 'lo-lin))
(when *mac* (require 'lo-mac))

;;; init.el ends here
