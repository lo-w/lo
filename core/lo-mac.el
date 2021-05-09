;;; mac --- load file when mac
;;; Code:
;;; Commentary:
;;; lo-mac.el


(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

(defun lo-toggle-fullscreen ()
  (interactive)
  (setq lo-fullscreen-p (not lo-fullscreen-p))
  (if lo-fullscreen-p
    (restore-frame)
    (maximize-frame)))

(global-set-key (kbd "F12") 'lo-toggle-fullscreen)

(provide 'lo-mac)

;;; lo-mac.el ends here