;; pkgs repo
(require 'package)
(setq package-archives '(("melpa-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
             ("gnu-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
             ("org-cn" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

(setq package-check-signature nil)

;; set the pkgs dir
(setq package-user-dir (expand-file-name "elpa" lo-dir))
(package-initialize)

(provide 'init-repo)
