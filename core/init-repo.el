;; pkgs repo
(require 'package)

(if (string-prefix-p "e" lo-user)
    (setq url-proxy-services
       '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
         ("http" . "www-proxy.ericsson.se:8080")
         ("https" . "www-proxy.ericsson.se:8080")))
    (progn
       (setq package-archives '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
         ("gnu-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
         ("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))))
       (setq package-check-signature nil))

;; set the pkgs dir
(setq package-user-dir (expand-file-name "elpa" lo-dir))
(package-initialize)

(provide 'init-repo)

