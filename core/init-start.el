;;; start --- start
;;; Code:
;;; Commentary:
;;; init-start.el

; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq visible-bell t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)

;; next line
;(set-fringe-mode -1)

; GC setting 100MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold (* 100 1024 1024))
(setq read-process-output-max (* 3 1024 1024))

;; warn when opening files bigger than 200MB
(setq large-file-warning-threshold 200000000)

(provide 'init-start)

;;; init-start.el ends here
