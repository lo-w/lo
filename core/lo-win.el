;;; win --- load file when win
;;; Code:
;;; Commentary:
;;; lo-win.el

(leaf emacs
  :if (display-graphic-p)
  :config
  ;; Font settings
  (if *win*
    (progn
      (set-face-attribute 'default nil :font "Cascadia code 13")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Cascadia code" :size 13))))
    (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))

(lo-toggle-fullscreen)
(provide 'lo-win)

;;; lo-win.el ends here
