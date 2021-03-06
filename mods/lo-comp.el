
;;; comp --- comp
;;; Code:
;;; Commentary:
;;; lo-comp.el

(leaf company
;  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init-hook . global-company-mode)
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 1
        company-show-numbers t
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
  (eval-after-load 'company
    '(add-to-list 'company-backends
                  '(company-abbrev
                    company-capf
                    company-etags
                    company-keywords
                    company-yasnippet))))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; Better sorting and filtering
(leaf company-prescient
  :init (company-prescient-mode 1))

;; Settings for yasnippet
(leaf yasnippet
  :config
  (setq yas-snippet-dirs (list (concat (file-name-as-directory lo-temp) "snippets")))
  (leaf yasnippet-snippets
    :after yasnippet)
  (leaf auto-yasnippet
    :bind (("C-o" . aya-open-line)))
  :hook
  (after-init-hook . yas-global-mode))

(provide 'lo-comp)

;;; lo-comp.el ends here
