;; windows
(leaf emacs
  :if (display-graphic-p)
  :config
  ;; Font settings
  (if *win*
    (progn
      (set-face-attribute 'default nil :font "Cascadia code 16")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Cascadia code" :size 16))))
    (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))

(lo-toggle-fullscreen)
(provide 'lo-win)
