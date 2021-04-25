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
        dashboard-path-max-length 30
        dashboard-path-style 'truncate-beginning
        dashboard-set-navigator t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-set-init-info nil
        dashboard-set-footer t
        dashboard-show-shortcuts nil
        ;; dashboard-startup-banner 'logo
        dashboard-items '((recents . 6)
                          (projects . 5)
                          (bookmarks . 5))

        dashboard-navigator-buttons
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
            (lambda (&rest _) (help-for-help)))))

        dashboard-footer-icon (all-the-icons-faicon "heart"
                                                    :height 1.1
                                                    :v-adjust -0.05
                                                    :face 'font-lock-keyword-face))

  :hook
  ((after-init-hook . dashboard-refresh-buffer)
   ;; (dashboard-refresh-buffer-hook . lo/dashboard-go-recents)
   ;; (dashboard-jump-to-recent-files-hook . dashboard-refresh-buffer)
   (dashboard-mode-hook . lo/dashboard-banner)))

;; (leaf dashboard-jump-to-recent-files
;;   :ensure nil
;;   :hook dashboard-refresh-buffer-hook)

;; (add-hook 'dashboard-refresh-buffer-hook
;;           (lambda ()
;;             (search-forward "re")))


(provide 'lo-dash)

;;; lo-dash.el ends here
