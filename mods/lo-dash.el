;;; dash --- dash
;;; Code:
;;; Commentary:
;;; lo-dash.el

(defun lo/dashboard-banner ()
  (setq dashboard-banner-logo-title
        (format "Emacs ready in %.2f seconds with %d garbage collections."
                (float-time (time-subtract after-init-time before-init-time)) gcs-done)))

(leaf dashboard
  :hook
  ((after-init-hook . dashboard-refresh-buffer)
   (dashboard-mode-hook . lo/dashboard-banner))
  :config
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-init-info "Welcome to my github: https://github.com/lo-w")
  (setq dashboard-set-navigator t)
  (dashboard-setup-startup-hook))

(setq dashboard-items '((recents . 6)
                        (bookmarks . 5)
                        (projects . 5)))

(provide 'lo-dash)

;;; lo-dash.el ends here