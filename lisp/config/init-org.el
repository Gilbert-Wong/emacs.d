;;; package --- init-org
;;; Commentary:
;;; Code:

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)
   ))

(defun turn-on-org-show-all-inline-images ()
  (org-display-inline-images t t))

(add-hook 'org-mode-hook 'turn-on-org-show-all-inline-images)

(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.10/libexec/plantuml.jar")

(expand-file-name "/usr/local/Cellar/plantuml/1.2018.10/libexec/plantuml.jar")

(provide 'init-org)
;;; init-org.el ends here
