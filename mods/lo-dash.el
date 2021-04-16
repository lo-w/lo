;;; dash --- dash
;;; Code:
;;; Commentary:
;;; lo-dash.el

(leaf all-the-icons)

(defun lo/dashboard-banner ()
  (setq dashboard-banner-logo-title
        (format "Emacs ready in %.2f seconds with %d garbage collections."
                (float-time (time-subtract after-init-time before-init-time)) gcs-done)))

(leaf dashboard
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-center-content t
        dashboard-set-navigator t
        dashboard-show-shortcuts nil
        dashboard-startup-banner 'logo
        mode-line-format nil)

  (setq dashboard-items '((recents . 6)
                          (projects . 5)
                          (bookmarks . 5)))

  (setq dashboard-navigator-buttons
        `(;; line1
          ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
           "Homepage"
           "Browse homepage"
           (lambda (&rest _) (browse-url "homepage")))
           ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
           ("?" "" "?/h" #'show-help nil "<" ">"))))

  
  (setq dashboard-footer-icon (cond ((icons-displayable-p)
                                     (all-the-icons-faicon "heart"
                                                           :height 1.1
                                                           :v-adjust -0.05
                                                           :face 'error))
                                    ((char-displayable-p ?❤) "❤ ")
                                    (t (propertize ">" 'face 'dashboard-footer))))

  :hook
  ((after-init-hook . dashboard-refresh-buffer)
   (dashboard-mode-hook . lo/dashboard-banner)))

(provide 'lo-dash)

;;; lo-dash.el ends here
