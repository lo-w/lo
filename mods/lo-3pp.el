;;; 3pp --- 3pp
;;; Code:
;;; Commentary:
;;; lo-3pp.el

(leaf diminish)
(leaf restart-emacs)

;; Settings for highlight parentheses
(leaf highlight-parentheses
  :hook (prog-mode-hook . highlight-parentheses-mode))

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
  :bind ("C-x p" . projectile-command-map)
  :config
  (setq projectile-cache-file (expand-file-name "projectile.cache" lo-temp)
        projectile-known-projects-file (expand-file-name "projectile-known-projects.eld" lo-temp)))

(leaf ace-window
  :bind
  (("M-o" . ace-window)))

(leaf magit)

(leaf neotree
  :bind
  ("C-c b" . neotree-toggle))

(provide 'lo-3pp)

;;; lo-3pp.el ends here
