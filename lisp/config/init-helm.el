;;; package --- init-ivy
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c h m") 'helm-make)

(global-set-key (kbd "C-c h p") 'helm-make-projectile)

(global-set-key (kbd "C-c h l") 'helm-make-list-target-method)

(global-set-key (kbd "C-c h f") 'helm-make-fuzzy-matching)

(provide 'init-helm)
;;; init-helm.el ends here
