;; windows
(use-package emacs
  :if (display-graphic-p)
  :config
  ;; Font settings
  (if *windows*
    (progn
      (set-face-attribute 'default nil :font "Cascadia code 10")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Cascadia code" :size 13))))

    (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))
(provide 'lo-win)
