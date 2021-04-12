;;; lsp --- lsp
;;; Code:
;;; Commentary:
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

  :commands
  (lsp lsp-deferred)

  :hook
  ((lsp-mode-hook lsp-enable-which-key-integration)
   (go-mode-hook lsp-deferred)
   (java-mode-hook lsp-deferred)
   (js-mode-hook lsp-deferred)
   (python-mode-hook lsp-deferred)))

;  :config
;  (leaf lsp-clients
;    :ensure nil
;    :defun (lsp-format-buffer lsp-organize-imports)))

(leaf lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)


(provide 'lo-lsp)

;;; lo-lsp.el ends here
