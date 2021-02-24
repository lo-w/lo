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

(defun lo-non-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND restore #xf120
      (w32-send-sys-command 61728)
    (progn (set-frame-parameter nil 'width 82)
           (set-frame-parameter nil 'fullscreen 'fullheight))))

(defun lo-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND maximaze #xf030
      (w32-send-sys-command 61488)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(defun lo-toggle-fullscreen ()
  (interactive)
  (setq lo-fullscreen-p (not lo-fullscreen-p))
  (if lo-fullscreen-p
      (lo-non-fullscreen)
    (lo-fullscreen)))

;(if (not *mac*) 'lo-toggle-fullscreen)

; GC setting
(setq gc-cons-threshold most-positive-fixnum)

(provide 'init-start)
