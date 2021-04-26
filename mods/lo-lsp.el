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
        lsp-idle-delay 0.500
        lsp-keep-workspace-alive nil
        lsp-keymap-prefix "C-c l"
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
  ((lsp-mode lsp-enable-which-key-integration)
   (go-mode lsp-deferred)
   (java-mode lsp-deferred)
   (json-mode lsp-deferred)
   (js-mode lsp-deferred)
   (python-mode lsp-deferred)))

(leaf lsp-ui
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
