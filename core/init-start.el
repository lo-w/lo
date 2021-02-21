;; startup

; customer
(setq custom-file
      (expand-file-name "custom.el" (concat user-emacs-directory "lo/mods/")))

(when (file-exists-p custom-file)
  (load-file custom-file))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -1)

(setq inhibit-startup-screen t)
(setq visible-bell t)

; GC setting
(setq gc-cons-threshold most-positive-fixnum)

(provide 'init-start)
