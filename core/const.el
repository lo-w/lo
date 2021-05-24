;;; const --- const
;;; Code:
;;; Commentary:
;;; const.el

(when (version< emacs-version "25.1")
  (error "Emacs require version 25.1 or newer, but you're running %s" emacs-version))

(defconst *mac* (eq system-type 'darwin))
(defconst *lin* (eq system-type 'gnu/linux))
(defconst *win* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(defvar lo-user (getenv (if *win* "USERNAME" "USER")))
(defvar lo-mods (expand-file-name "mods" lo-dir))
(defvar lo-temp (expand-file-name "temp" lo-dir))

; customer
(setq custom-file
      (expand-file-name "custom.el" lo-temp))

;; hide cl pkg warning
(setq byte-compile-warnings '(cl-functions))

;; Settings for backup files
(setq make-backup-files nil
      auto-save-default nil)

(setq auto-save-list-file-prefix nil)

(defvar lo-fullscreen-p t "Check if fullscreen is on or off")

(defun lo-non-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND restore #xf120
      (w32-send-sys-command 61728)
    (progn (set-frame-parameter nil 'width 82)
           (set-frame-parameter nil 'fullscreen 'fullheight))))

(defun lo-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND maximaze #xf030
      (w32-send-sys-command 61488)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(defun lo-toggle-fullscreen ()
  (interactive)
  (setq lo-fullscreen-p (not lo-fullscreen-p))
  (if lo-fullscreen-p
      (lo-non-fullscreen)
    (lo-fullscreen)))

(defconst RIGHT_PADDING 1)

(defun reserve-left/middle ()
  (/ (length (format-mode-line mode-line-align-middle)) 2))

(defun reserve-middle/right ()
  (+ RIGHT_PADDING (length (format-mode-line mode-line-align-right))))

(defun mode-line-fill-right (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun mode-line-fill-center (face reserve)
  "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                             (.5 . left-margin))))
              'face face))

(defun lo-init ()
  (require 'init-start)
  (require 'init-edit)
  (require 'init-pkgs)
  (require 'init-kbds))

(defun lo-dump ()
  (global-font-lock-mode)
  (transient-mark-mode)
  (set-frame-parameter (selected-frame) 'alpha '(85 55)))

(setq fonts '("Cascadia Mono" "Cascadia Mono"))
(setq fsize '(13 13))

(provide 'const)

;;; const.el ends here
