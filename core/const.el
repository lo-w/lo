;; const

(when (version< emacs-version "25.1")
  (error "Emacs require version 25.1 or newer, but you're running %s" emacs-version))

(defconst *mac* (eq system-type 'darwin))
(defconst *linux* (eq system-type 'gnu/linux))
(defconst *windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(setq auto-save-list-file-prefix nil)
(setq recentf-save-file (expand-file-name "recentf" lo-dir))

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

(defvar lo-user (getenv (if *windows* "USERNAME" "USER")))

(defvar lo-packages
  '(ace-window
    crux
    easy-kill
    flycheck
    git-timemachine
    gitconfig-mode
    gitignore-mode
    projectile
    magit
    smartparens
    undo-tree
    which-key)
  "A list of packages to ensure are installed at launch.")

(provide 'const)
