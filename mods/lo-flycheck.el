;;; flycheck --- flycheck
;;; Code:
;;; Commentary:
;;; lo-flycheck.el

(leaf flycheck
  :hook (prog-mode-hook . flycheck-mode)
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
  :custom ((flycheck-python-flake8-executable . "python")
           (flycheck-python-pycompile-executable . "python")
           (flycheck-python-pylint-executable . "python")))

(provide 'lo-flycheck)

;;; lo-flycheck.el ends here
