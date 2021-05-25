
;;; 3pp --- 3pp
;;; Code:
;;; Commentary:
;;; lo-3pp.el

(leaf restart-emacs
  :bind ("C-c r" . restart-emacs))

;; Settings for highlight parentheses
(leaf highlight-parentheses
  :hook (prog-mode-hook . highlight-parentheses-mode))

(leaf smartparens
  :bind
  ("M-n" . sp-forward-sexp)
  ("M-p" . sp-backward-sexp)
  ("C-)" . sp-forward-slurp-sexp)
  ("C-(" . sp-backward-slurp-sexp)
  ("M-)" . sp-forward-barf-sexp)
  ("M-(" . sp-backward-barf-sexp)
  ("C-S-s" . sp-splice-sexp)
  ("C-M-<backspace>" . backward-kill-sexp)
  :config
  (sp-pair "'" nil :actions :rem)
  (smartparens-global-mode t))

(leaf rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))

(leaf which-key
  :leaf-defer nil
  :config (which-key-mode))

(leaf benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init-hook . benchmark-init/deactivate))

(leaf projectile
  :hook (after-init-hook projectile-mode)
  :bind ("C-c p" . projectile-command-map)
  :config
  (setq projectile-cache-file (expand-file-name "projectile.cache" lo-temp)
        projectile-known-projects-file (expand-file-name "projectile-known-projects.eld" lo-temp)))

(leaf ace-window
  :bind
  (("M-o" . ace-window)))

(leaf magit)
;(leaf neotree
;  :bind
;  ("C-c b" . neotree-toggle))

(leaf keyfreq
  :init
  (setq keyfreq-excluded-commands
        '(forward-char
          backward-char
          forward-word
          backward-word
          previous-line
          next-file
          newline)
        keyfreq-file (expand-file-name ".emacs.keyfreq" lo-temp))
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(provide 'lo-3pp)

;;; lo-3pp.el ends here
