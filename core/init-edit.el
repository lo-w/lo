;;; edit --- edit
;;; Code:
;;; Commentary:
;;; init-edit.el

; system code setting
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; blink the cursor
(blink-cursor-mode 1)

;; don't use tabs to indent but maintain correct appearance
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; replace characters when words selected
(delete-selection-mode 1)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;; enable up/lower case
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(provide 'init-edit)

;;; init-edit.el ends here
