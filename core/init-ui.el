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


(defun simple-major-mode-name ()
  "Return simplifyed major mode name"
  (let* ((major-name (format-mode-line "%m"))
         (replace-table '(Emacs-Lisp "𝝀"
                                     Python "𝝅"
                                     Shell ">"
                                     Makrdown "𝓜"
                                     GFM "𝓜"
                                     Go "𝓖"
                                     Java "𝓙𝓐𝓥𝓐"
                                     Javascript "𝓙𝓢"
                                     Org "𝒪"
                                     Text "𝓣"
                                     Fundamental "𝓕"))
         (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name replace-name major-name)))

(leaf nyan-mode
  :hook (after-init-hook . nyan-mode))

;; (setq
;;   mode-line-format
;;   (list
;;   ;; the buffer name; the file name as a tool tip
;;   "   "
;;   '(:eval (propertize "%b " 'face 'font-lock-keyword-face
;;                       'help-echo (buffer-file-name)))

;;   ;; line and column
;;   " " ;; '%02' to set to 2 chars at least; prevents flickering
;;   (propertize "%05l" 'face 'font-lock-type-face) ","
;;   ;; (propertize "%02c" 'face 'font-lock-type-face)
;;   " "

;;   ;; relative position, size of file
;;   "["
;;   (propertize "%p" 'face 'font-lock-constant-face)
;;   "/"
;;   (propertize "%I" 'face 'font-lock-constant-face)
;;   "] "

;;   ;; the current major mode for the buffer.
;;   "["
;;   '(:eval (propertize (simple-major-mode-name) 'face 'font-lock-string-face
;;                       'help-echo buffer-file-coding-system))
;;   "] "

;;   "[" ;; insert vs overwrite mode, input-method in a tooltip
;;   '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
;;                       'face 'font-lock-preprocessor-face
;;                       'help-echo (concat "Buffer is in "
;;                                          (if overwrite-mode "overwrite" "insert") " mode")))

;;   ;; was this buffer modified since the last save?
;;   '(:eval (when (buffer-modified-p)
;;             (concat ", "  (propertize "Mod"
;;                                      'face 'font-lock-warning-face
;;                                      'help-echo "Buffer has been modified"))))

;;   ;; is this buffer read-only?
;;   '(:eval (when buffer-read-only
;;             (concat ","  (propertize "RO"
;;                                      'face 'font-lock-type-face
;;                                      'help-echo "Buffer is read-only"))))
;;   "] "

;;   ;; evil state
;;   '(:eval (evil-generate-mode-line-tag evil-state))

;;   " "
;;   ;; add the time, with the date and the emacs uptime in the tooltip
;;   '(:eval (propertize (format-time-string "%H:%M")
;;                       'help-echo
;;                       (concat (format-time-string "%c; ")
;;                               (emacs-uptime "Uptime:%hh"))))
;;   "  "

;;   ;; nyan mode
;;   "["
;;   '(:eval (when nyan-mode (list (nyan-create))))
;;   ;; '(:eval nyan-mode)
;;   "] "

;;   " "
;;   ;; i don't want to see minor-modes; but if you want, uncomment this:
;;   ;; minor-mode-alist  ;; list of minor modes
;;   ;; "%-" ;; fill with '-'
;;   ))

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
