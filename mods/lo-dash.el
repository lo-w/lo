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
        dashboard-page-separator "\n\n"
        dashboard-set-navigator t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-set-init-info nil
        dashboard--section-starts 'recents
        dashboard-set-footer t
        dashboard-show-shortcuts nil)
        ;; dashboard-startup-banner 'logo

  (setq dashboard-items '((recents . 6)
                          (projects . 5)
                          (bookmarks . 5)))

  (setq dashboard-navigator-buttons
        `(;; line1
          ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
            (lambda (&rest _) (browse-url "https://github.com/lo-w/")))

           (,(all-the-icons-material "restore" :height 1.35 :v-adjust -0.24)
            "Restore"
            "Restore previous session"
            (lambda (&rest _) (restore-previous-session)))

           (,(all-the-icons-faicon "question" :height 1.2 :v-adjust -0.1)
            "/h"
            "help (?/h)"
            (lambda (&rest _) (help-with-tutorial))))))

  (setq dashboard-footer-icon (all-the-icons-faicon "heart"
                                                    :height 1.1
                                                    :v-adjust -0.05
                                                    :face 'font-lock-keyword-face))
  :hook
  ((after-init-hook . dashboard-refresh-buffer)
   (dashboard-mode-hook . lo/dashboard-banner)))

(provide 'lo-dash)

;;; lo-dash.el ends here
