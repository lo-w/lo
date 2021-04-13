;;; check --- check
;;; Code:
;;; Commentary:
;;; lo-check.el

;(leaf flycheck
;  :hook (prog-mode-hook . flycheck-mode)
;  :bind (("M-n" . flycheck-next-error)
;         ("M-p" . flycheck-previous-error))
;  :custom ((flycheck-python-flake8-executable . "python")
;           (flycheck-python-pycompile-executable . "python")
;           (flycheck-python-pylint-executable . "python")))

;; [built-in] Enable flymake on default, which is built in emacs
(leaf flymake
  :ensure nil
  :hook (prog-mode-hook . flymake-mode)
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

;; Settings for highlight parentheses
(leaf highlight-parentheses
  :hook (prog-mode-hook . highlight-parentheses-mode))

(leaf rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))


(provide 'lo-check)

;;; lo-check ends here
