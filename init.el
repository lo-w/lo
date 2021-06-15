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

(when 'display-graphic-p
  (require 'lo-org)
  (require 'lo-lsp)
  (require 'lo-prog)
  (require 'lo-dash)
  (require 'init-ui))

;;; init.el ends here
