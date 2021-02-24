;; const

(when (version< emacs-version "25.1")
  (error "Emacs require version 25.1 or newer, but you're running %s" emacs-version))

(defconst *mac* (eq system-type 'darwin))
(defconst *linux* (eq system-type 'gnu/linux))
(defconst *windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(defvar lo-fullscreen-p t "Check if fullscreen is on or off")
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
