;;; org --- org
;;; Code:
;;; Commentary:
;;; lo-org.el


(require 'org-tempo)

(setq-default org-use-sub-superscripts nil)
(setq org-confirm-babel-evaluate nil
      org-export-with-section-numbers t)

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

(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("ja" . "src java"))
(add-to-list 'org-structure-template-alist '("js" . "src js"))

(set-face-attribute 'org-level-1 nil :height 1.4 :bold t)
(set-face-attribute 'org-level-2 nil :height 1.2 :bold t)
(set-face-attribute 'org-level-3 nil :height 1.0 :bold t)

(provide 'lo-org)

;;; lo-org.el ends here
