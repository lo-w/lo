;; startup

; customer
(setq custom-file
      (expand-file-name "custom.el" (concat user-emacs-directory "lo/mods/")))

(when (file-exists-p custom-file)
  (load-file custom-file))

; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq visible-bell t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode -1)
(tooltip-mode -1)

; GC setting
(setq gc-cons-threshold most-positive-fixnum)

(provide 'init-start)
