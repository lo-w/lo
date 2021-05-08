;;; lsp --- lsp
;;; Code:
;;; Commentary:
;;; lo-lsp.el

(setq lsp-clients-python-command (concat (getenv "PY37_HOME") "\\Scripts\\pyls"))

(leaf lsp-mode
  :init
  (setq lsp-auto-guess-root t
        lsp-completion-provider :capf
        lsp-enable-snippet t
        lsp-enable-indentation t
        lsp-enable-on-type-formatting t
        lsp-idle-delay 0.1
        lsp-keep-workspace-alive nil
        lsp-keymap-prefix "C-c l"
        lsp-log-io nil
        lsp-minimum-prefix-length 2
        lsp-modeline-diagnostics-enable t
        lsp-modeline-diagnostics-scope :workspace
        lsp-trace nil
        lsp-prefer-capf t
        lsp-prefer-flymake t
        lsp-print-io nil
        lsp-print-performance nil
        read-process-output-max (* 1024 1024))
  :commands
  (lsp lsp-deferred)
  :hook
  ((lsp-mode-hook . lsp-enable-which-key-integration)
   (go-mode-hook . lsp-deferred)
   (java-mode-hook . lsp-deferred)
   (json-mode-hook . lsp-deferred)
   (js-mode-hook . lsp-deferred)
   (python-mode-hook . lsp-deferred)))

(leaf lsp-ui
  :init
  (setq lsp-prefer-flymake t)
  ;;       lsp-ui-doc-enable nil
  ;;       lsp-ui-imenu-enable nil
  ;;       lsp-ui-sideline-enable nil
  ;;       lsp-enable-symbol-highlighting nil)
  :hook
  (lsp-mode-hook . lsp-ui-mode)
  (python-mode-hook . flymake-mode))

(leaf lsp-ivy :commands lsp-ivy-workspace-symbol)
(leaf lsp-treemacs :commands lsp-treemacs-errors-list)

;; (leaf company-lsp
;;   :ensure nil
;;   :config
;;   (push 'company-lsp company-backends))

(leaf helm-lsp :after lsp-mode :commands helm-lsp-workspace-symbol)
(leaf dap-mode)

(provide 'lo-lsp)

;;; lo-lsp.el ends here
