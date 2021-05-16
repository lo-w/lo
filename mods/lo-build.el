;;; build --- build in
;;; Code:
;;; Commentary:
;;; lo-build.el

;; [built-in] paren mode
(leaf paren
  :ensure nil
  :config (show-paren-mode 1))

;; [built-in] recentf
(leaf recentf
  :leaf-defer nil
  :config
  (setq recentf-max-menu-item 20
        recentf-max-saved-items 25
        recentf-save-file (expand-file-name "recentf" lo-temp)
        recentf-exclude '("recentf\\'"
                          "log"
                          "etc"
                          "lisp"
                          "COMMIT_EDITMSG\\'"
                          ".*-autoloads\\.el\\'"
                          "elpa.*")))

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

;; [built-in] Enable flymake on default, which is built in emacs
(leaf flymake
  :ensure nil
  :hook (prog-mode-hook . flymake-mode)
  :bind (("C-M-n" . flymake-goto-next-error)
         ("C-M-p" . flymake-goto-prev-error)))

;; [built-in] auto remove the useless white spaces
(leaf simple
  :ensure nil
  :hook (before-save-hook . delete-trailing-whitespace))

;; [built-in] set eww dir
(leaf eww
  :ensure nil
  :config
  (setq url-cookie-file (concat (file-name-as-directory lo-temp) "url/cookies")
        url-configuration-directory (concat (file-name-as-directory lo-temp) "url")))

;; [built-in] set eshell dir
(leaf eshell
  :ensure nil
  :config
  (setq eshell-directory-name (concat (file-name-as-directory lo-temp) "eshell")))

(provide 'lo-build)

;;; lo-build.el ends here
