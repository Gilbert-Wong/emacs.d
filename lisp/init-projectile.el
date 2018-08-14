;;; package --- init-projectile
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)

;; (global-set-key (kbd "C-c p p") 'projectile-switch-project)

(global-set-key (kbd "C-c p a") 'counsel-projectile-ag)

(global-set-key (kbd "C-c p g") 'counsel-projectile-grep)

(provide 'init-projectile)
;;; init-projectile.el ends here
