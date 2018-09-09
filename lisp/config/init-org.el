;;; package --- init-org
;;; Commentary:
;;; Code:


(add-to-list
  'org-src-lang-modes '("plantuml" . plantuml))

(defun turn-on-org-show-all-inline-images ()
  (org-display-inline-images t t))

(add-hook 'org-mode-hook 'turn-on-org-show-all-inline-images)

(provide 'init-org)
;;; init-org.el ends here
