;;; package --- init-projectile
;;; Commentary:
;;; Code:

(setq projectile-keymap-prefix (kbd "C-c C-p"))

(setq projectile-enable-caching t)

(global-set-key (kbd "C-c p f") 'counsel-projectile-find-file)

(global-set-key (kbd "C-c p p") 'counsel-projectile-switch-project)

(global-set-key (kbd "C-c p a") 'counsel-projectile-ag)

(global-set-key (kbd "C-c p r") 'counsel-projectile-rg)

(global-set-key (kbd "C-c p g") 'counsel-projectile-grep)

(provide 'init-projectile)
;;; init-projectile.el ends here
