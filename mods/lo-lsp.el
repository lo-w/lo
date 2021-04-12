;;; lo-lsp.el


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
  :commands (lsp lsp-deferred)
  :hook
  (python-mode-hook lsp-deferred))

;  :config
;  (leaf lsp-clients
;    :ensure nil
;    :defun (lsp-format-buffer lsp-organize-imports)))


(provide 'lo-lsp)
