;;; pkgs --- pkgs
;;; Code:
;;; Commentary:
;;; init-pkgs.el

(require 'package)

;; set proxy
(if (string-prefix-p "e" lo-user)
    (setq url-proxy-services
       '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
         ("http" . "www-proxy.ericsson.se:8080")
         ("https" . "www-proxy.ericsson.se:8080"))))

(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ("org"   . "https://orgmode.org/elpa/")))

;; set the pkgs dir to the relative path
(setq package-user-dir (expand-file-name "elpa" lo-dir))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'leaf )
  (package-refresh-contents)
  (package-install 'leaf ))

; leaf defaults settings
(leaf leaf
  :custom ((leaf-defaults . '(:ensure t
                              :require t
                              :leaf-defer t))))

(leaf diminish)
(leaf restart-emacs)

(leaf which-key
  :leaf-defer nil
  :config (which-key-mode))

(leaf benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init-hook . benchmark-init/deactivate))

;; set recentf
(leaf recentf
  :leaf-defer nil
  :config
  (setq recentf-max-menu-item 10
        recentf-save-file (expand-file-name "recentf" lo-temp)
        recentf-exclude '("recentf\\'"
                          "COMMIT_EDITMSG\\'"
                          ".*-autoloads\\.el\\'"
                          "[/\\]\\.elpa/")))

(leaf projectile
;  :diminish (projectile-mode " Proj.")
  :hook (after-init-hook projectile-mode)
  :bind ("C-c p" . projectile-command-map))

;; [built-in] paren mode
(leaf paren
  :ensure nil
  :config (show-paren-mode 1))

;; [built-in] electric-pair
(leaf electric
  :ensure nil
  :hook ((after-init-hook . electric-indent-mode)
         (prog-mode-hook . electric-pair-mode)))

(require 'init-mods)
(provide 'init-pkgs)

;;; init-pkgs.el ends here
