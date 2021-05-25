;;; mac --- load file when mac
;;; Code:
;;; Commentary:
;;; lo-mac.el


(setq fonts '("Monaco" "Monaco")
      fsize '(17 20))

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

(global-set-key (kbd "<f12>") 'toggle-frame-fullscreen)

(provide 'lo-mac)

;;; lo-mac.el ends here
