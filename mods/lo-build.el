;;; build --- build in
;;; Code:
;;; Commentary:
;;; lo-build.el

;; [built-in] paren mode
(leaf paren
  :ensure nil
  :config (show-paren-mode 1))

;; [built-in] electric-pair
(leaf electric
  :ensure nil
  :hook ((after-init-hook . electric-indent-mode)
         (prog-mode-hook . electric-pair-mode)))

;; [built-in] recentf
(leaf recentf
  :leaf-defer nil
  :config
  (setq recentf-max-menu-item 20
        recentf-max-saved-items 25
        recentf-save-file (expand-file-name "recentf" lo-temp)
        recentf-exclude '("recentf\\'"
                          "log"
                          "lisp"
                          "COMMIT_EDITMSG\\'"
                          ".*-autoloads\\.el\\'"
                          "[/\\]\\.elpa/")))

;; [built-in] dired-x
;; we can using C-x C-j to open current dir
(leaf dired-x
  :ensure nil)

;; [built-in] dired set recrusive copy/del by default
(leaf dired
  :ensure nil
  :config
  (setq dired-dwin-target 1
        dired-recursive-copies 1
        dired-recursive-deletes 1)
  (put 'dired-find-alternate-file 'disabled nil)
  :bind
  (:dired-mode-map
   ("RET" . dired-find-alternate-file)
   ("j" . dired-next-line)
   ("k" . dired-previous-line)))

(provide 'lo-build)

;;; lo-build.el ends here
