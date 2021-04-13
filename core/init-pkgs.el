;;; pkgs --- pkgs
;;; Code:
;;; Commentary:
;;; init-pkgs.el

(require 'package)

(setq package-archives '(("elpa"  . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")))

;; set the pkgs dir to the relative path
(setq package-user-dir (expand-file-name "elpa" lo-dir))

(unless (bound-and-true-p package--initialized)
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'leaf )
  (package-install 'leaf ))

; leaf defaults settings
(leaf leaf
  :custom ((leaf-defaults . '(:ensure t
                              :require t
                              :leaf-defer t))))

(leaf restart-emacs)
(leaf diminish)
(leaf which-key
  :leaf-defer nil
  :config (which-key-mode))

(leaf benchmark-init
  :init (benchmark-init/activate)
  :hook (after-init-hook . benchmark-init/deactivate))

(leaf projectile
;  :diminish (projectile-mode " Proj.")
  :hook (after-init-hook projectile-mode)
  :bind ("C-c p" . projectile-command-map))

(require 'init-mods)
(provide 'init-pkgs)

;;; init-pkgs.el ends here
