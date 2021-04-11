;;; lo-org.el


(leaf org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'lo-org)
