;;; org --- org
;;; Code:
;;; Commentary:
;;; lo-org.el


(require 'org-tempo)

(leaf org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (java . t)
   (js . t)
   (shell . t)
   (python . t)))

(setq org-confirm-babel-evaluate nil)

(provide 'lo-org)

;;; lo-org.el ends here
