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
(leaf leaf-keywords
    :config
    (leaf diminish)
    (leaf-keywords-init))

(add-to-list 'load-path lo-mods)

;; add termial required pkgs
(require 'lo-build)
(require 'lo-3pp)
(require 'lo-ivy)
(require 'lo-comp)

(provide 'init-pkgs)

;;; init-pkgs.el ends here
