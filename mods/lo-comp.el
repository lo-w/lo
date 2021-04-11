;;; lo-comp.el

(leaf company
;  :diminish (company-mode " Cmp.")
;  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :hook (after-init-hook . global-company-mode)
  :config (setq company-dabbrev-code-everywhere t
                company-dabbrev-code-modes t
                company-dabbrev-code-other-buffers 'all
                company-dabbrev-downcase nil
                company-dabbrev-ignore-case t
                company-dabbrev-other-buffers 'all
                company-require-match nil
                company-minimum-prefix-length 2
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
                           '(company-abbrev company-yasnippet company-capf))))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; Better sorting and filtering
(leaf company-prescient
  :init (company-prescient-mode 1))

(provide 'lo-comp)
