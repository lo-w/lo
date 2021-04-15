;;; dash --- dash
;;; Code:
;;; Commentary:
;;; lo-dash.el

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

  (setq dashboard-items '((recents . 10)
                          (projects . 5)
                          (bookmarks . 5)))

  ;; (setq dashboard-navigator-buttons
  ;;       `(;; line1
  ;;         ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
  ;;          "Homepage"
  ;;          "Browse homepage"
  ;;          (lambda (&rest _) (browse-url "homepage")))
  ;;         ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
  ;;         ("?" "" "?/h" #'show-help nil "<" ">"))
  ;;          ;; line 2
  ;;         ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
  ;;           "Linkedin"
  ;;           ""
  ;;           (lambda (&rest _) (browse-url "homepage")))
  ;;          ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))

  ;; (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
  ;;       :height 1.1
  ;;       :v-adjust -0.05
  ;;       :face 'font-lock-keyword-face))

  :hook
  ((after-init-hook . dashboard-refresh-buffer)
   (dashboard-mode-hook . lo/dashboard-banner)))

(provide 'lo-dash)

;;; lo-dash.el ends here
