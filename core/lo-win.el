;;; win --- load file when win
;;; Code:
;;; Commentary:
;;; lo-win.el

(leaf emacs
  :if (display-graphic-p)
  :config
  ;; Font settings
  (setq fonts '("Cascadia Mono" "微软雅黑"))
  (setq fsize '(13 18))

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

(lo-toggle-fullscreen)
(provide 'lo-win)

;;; lo-win.el ends here
