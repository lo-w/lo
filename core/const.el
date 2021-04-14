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

(provide 'const)

;;; const.el ends here