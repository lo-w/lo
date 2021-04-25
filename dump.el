;;; dump --- dump
;;; Code:
;;; Commentary:
;;; lo-dump.el


(require 'package)
(package-initialize)

(setq lo-dumped-load-path load-path
      lo-dumped t)

(defvar lo-dir (file-name-directory load-file-name))
(defvar lo-core (expand-file-name "core" lo-dir))
(defvar lo-mods (expand-file-name "mods" lo-dir))
(defvar lo-temp (expand-file-name "temp" lo-dir))

(add-to-list 'load-path lo-core)
(add-to-list 'load-path lo-mods)

(dolist (package '( leaf
                    crux drag-stuff hungry-delete
                    paren electric recentf dired dired-x eww eshell simple flycheck
                    diminish restart-emacs which-key benchmark-init projectile ace-window magit 
                    smartparens rainbow-delimiters highlight-parentheses
                    company company-prescient yasnippet yasnippet-snippets auto-yasnippet
                    all-the-icons ;dashboard
                    ivy counsel swiper
                    lsp-mode lsp-ui lsp-ivy lsp-treemacs helm-lsp dap-mode
                    org org-bullets
                    unicode-fonts smart-mode-line gruvbox-theme doom-themes))
  (require package))

(require 'const)
(require 'init-start)
(require 'init-edit)
(require 'lo-build)
(require 'lo-3pp)
(require 'lo-comp)
;; (require 'lo-dash)
(require 'lo-ivy)
(require 'lo-lsp)
(require 'lo-org)
(require 'init-kbds)
(require 'init-ui)

;; dump image
(dump-emacs-portable "~/.emacs.d/emacs.pdmp")

;;; lo-dump.el ends here
