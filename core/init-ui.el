;;; ui
(leaf gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

(leaf smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
    sml/theme 'respectful)
  (sml/setup))

(when (file-exists-p custom-file)
  (load-file custom-file))

(provide 'init-ui)
