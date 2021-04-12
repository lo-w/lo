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
(set-fringe-mode -1)
(tooltip-mode -1)

; GC setting 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 1000MB
(setq large-file-warning-threshold 1000000000)

(provide 'init-start)

;;; init-start.el ends here