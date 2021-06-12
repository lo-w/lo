;;; ui --- ui
;;; Code:
;;; Commentary:
;;; init-ui.el


(leaf smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
    sml/theme 'respectful)
  (sml/setup))

(leaf unicode-fonts
  :hook
  (after-init-hook . unicode-fonts-setup))

(defun simple-major-mode-name()
  "Return simplifyed major mode name"
  (let* ((major-name (format-mode-line "%m"))
         (replace-table '(Emacs-Lisp "𝝀"
                                     Dired\ by\ name "𝓓"
                                     Lisp\ Interaction "𝝀"
                                     Py "𝝅"
                                     Shell ">"
                                     Makrdown "𝓜"
                                     GFM "𝓜"
                                     Javascript-IDE "𝓙𝓢"
                                     Java//l "𝓙𝓐𝓥𝓐"
                                     Go "𝓖"
                                     Org "𝒪"
                                     Text "𝓣"
                                     Fundamental "𝓕"))
         (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name replace-name major-name)))

(leaf nyan-mode
  :hook
  (after-init-hook . nyan-mode))

(setq mode-line-align-left
  '(""
    ;; the buffer name; the file name as a tool tip
    "%3 "
    (:eval (propertize "%b "
                       'face
                       '(:foreground "red")  ;;font-lock-keyword-face
                       'help-echo (buffer-file-name)))
    ;; git branch
    (vc-mode vc-mode)

    ;; line and column
    "" ;; '%05' to set to 5 chars at least; prevents flickering
    (:eval (propertize "%05l" 'face 'font-lock-type-face)) ","
    (:eval (propertize "%03c" 'face 'font-lock-type-face))
    ;; (:eval (format "%%l/%d : %%c " (line-number-at-pos (point-max))))
    " "

    ;; relative position, size of file
    "["
    (:eval (propertize "%p" 'face 'font-lock-constant-face))
    "/"
    (:eval (propertize "%I" 'face 'font-lock-constant-face))
    "] "

    "[" ;; insert vs overwrite mode, input-method in a tooltip
    (:eval (if buffer-read-only
             (propertize "RO"
                         'face
                         'font-lock-type-face
                         'help-echo "Buffer is read-only")))
    (:eval (if (not buffer-read-only)
               (propertize (if overwrite-mode "Ovr" "Ins")
                           'face
                           'font-lock-preprocessor-face
                           'help-echo (concat "Buffer is in "
                                              (if overwrite-mode "overwrite" "insert") " mode"))))
    ;; was this buffer modified since the last save
    (:eval (if (not buffer-read-only)
               (when (buffer-modified-p)
                 (concat ", "  (propertize "Mod"
                                           'face
                                           'font-lock-warning-face
                                           'help-echo "Buffer has been modified")))))
    "] "
  ))

(setq mode-line-align-middle
      '(""
       ;; the current major mode for the buffer.
       "["
       (:eval (propertize (simple-major-mode-name)
                          'face
                          'font-lock-string-face
                          'help-echo (symbol-name buffer-file-coding-system)))
       "] "
       ;; minor-modes
       (:eval minor-mode-alist)
       ;; nyan mode
       " ["
       (:eval (if 'display-graphic-p
                  (when nyan-mode (list (nyan-create)))))
       "] "
       ))

(setq mode-line-align-right
      '(""
        ;; add the time, with the date and the emacs uptime in the tooltip
        (:eval (propertize (format-time-string "%H:%M%16")
                           'help-echo
                           (concat (format-time-string "%c; ")
                                   (emacs-uptime "Uptime:%hh"))))
        ;; end ---
        ))

(setq-default mode-line-format
              (list
               mode-line-align-left
               '(:eval (mode-line-fill-center 'mode-line (reserve-left/middle)))
               mode-line-align-middle
               '(:eval (mode-line-fill-right 'mode-line (reserve-middle/right)))
               mode-line-align-right))

;; (set-face-background 'mode-line "#AAAAAA")
;; (setq whitespace-line-column 200)
;; (global-whitespace-mode t)
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray13")

;; transparent background
(set-frame-parameter (selected-frame) 'alpha '(90 55))

;; hide some minor modes
(leaf leaf
  :diminish
  auto-revert-mode
  abbrev-mode
  company-mode
  eldoc-mode
  highlight-parentheses-mode
  ivy-mode
  lsp-mode
  outline-minor-mode
  projectile-mode
  smartparens-mode
  which-key-mode
  yas-minor-mode)

(when *win* (require 'lo-win))
(when *lin* (require 'lo-lin))
(when *mac* (require 'lo-mac))

(leaf emacs
  :if (and 'display-graphic-p fonts fsize)
  :config
  ;; set english font
  (set-face-attribute 'default nil :font
                      (format "%s %d" (car fonts) (car fsize)))
  ;; set chinese charater fonts
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec
                       :family (cadr fonts)
                       :size (cadr fsize)))))

;; load theme and full size screen
(if *mac*
    (progn
      (leaf solarized-theme
        :init (load-theme 'solarized-dark t)))
  (progn
    (leaf emacs
      :init (load-theme 'wheatgrass t))))

(toggle-frame-fullscreen)

(when (file-exists-p custom-file)
  (load-file custom-file))

;; (leaf emacs
;;  :init (load-theme 'tango-dark t))

(provide 'init-ui)

;;; init-ui.el ends here
