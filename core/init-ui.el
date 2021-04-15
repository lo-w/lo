;;; ui --- ui
;;; Code:
;;; Commentary:
;;; init-ui.el


(leaf smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
    sml/theme 'respectful)
  (sml/setup))

(leaf emacs
  :init (load-theme 'wheatgrass t))

;; (leaf gruvbox-theme
;;  :init (load-theme 'gruvbox-dark-soft t))

;; (leaf emacs
;;  :init (load-theme 'tango-dark t))

;(setq whitespace-line-column 200)
;(global-whitespace-mode t)
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray13")

;; transparent background
;;(set-background-color "gray")
(set-frame-parameter (selected-frame) 'alpha '(85 55))

(when (file-exists-p custom-file)
  (load-file custom-file))

(provide 'init-ui)

;;; init-ui.el ends here
