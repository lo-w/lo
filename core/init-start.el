;; startup

; system code setting
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

; customer
(setq custom-file
      (expand-file-name "custom.el" (concat user-emacs-directory "lo/lisp/")))

(when (file-exists-p custom-file)
  (load-file custom-file))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

; GC setting
(setq gc-cons-threshold most-positive-fixnum)

(provide 'init-start)
