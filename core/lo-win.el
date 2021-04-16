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
      (set-face-attribute 'default nil :font "Cascadia code 16")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family "Cascadia code" :size 16))))
    (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))

;; (defun lo-dump-emacs ()
;;   (interactive)
;;   (load "e:/projects/emacs-config/install.el")
;;   (start-process "dump-emacs" "*dump*" "cmd" "/c" "cd" "/d" "E:\\dev-env\\emacs-src\\git\\emacs\\src\\oo-spd\\i386\\temacs.exe" "-batch" "-l" "loadup" "bootstrap")
;;   (with-current-buffer "*dump*"
;;     (viper-mode))
;;   (switch-to-buffer "*dump*")
;;   (labels ((%sentinel (process event)
;;              (when (equal 'exit (process-status process))
;;                (when (= 0 (process-exit-status process))
;;                  (let ((tmp-path "d:/emacs/bin/emacs.bak.exe"))
;;                    (when (file-exists-p tmp-path)
;;                      (condition-case nil
;;                           (delete-file tmp-path)
;;                         (error (setq tmp-path "d:/emacs/bin/emacs.exe3")
;;                                (when (file-exists-p tmp-path)
;;                                  (delete-file tmp-path)))))
;;                    (rename-file "d:/emacs/bin/emacs.exe" tmp-path))
;;                  (copy-file "E:\\dev-env\\emacs-src\\git\\emacs\\src\\oo-spd\\i386\\emacs.exe"
;;                             "d:/emacs/bin/emacs.exe" t)))))
;;     (set-process-sentinel (get-process "dump-emacs") '%sentinel)))

(lo-toggle-fullscreen)
(provide 'lo-win)

;;; lo-win.el ends here
