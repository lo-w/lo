;;; ui --- ui
;;; Code:
;;; Commentary:
;;; init-ui.el

(leaf gruvbox-theme
  :init (load-theme 'gruvbox-dark-soft t))

(leaf smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
    sml/theme 'respectful)
  (sml/setup))

;(setq whitespace-line-column 200)
;(global-whitespace-mode t)
(global-hl-line-mode 1)

;; transparent background
;;(set-background-color "gray")
(set-frame-parameter (selected-frame) 'alpha '(85 55))

(when (file-exists-p custom-file)
  (load-file custom-file))

(provide 'init-ui)

;;; init-ui.el ends here
