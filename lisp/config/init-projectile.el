;;; package --- init-projectile
;;; Commentary:
;;; Code:


(use-package projectile
  :ensure t
  :bind
  (("C-c p f" . 'counsel-projectile-find-file)
   ("C-c p p" . 'counsel-projectile-switch-project)
   ("C-c p a" . 'counsel-projectile-ag)
   ("C-c p r" . 'counsel-projectile-rg)
   ("C-c p g" . 'counsel-projectile-grep)
   )
  :config
  (setq projectile-enable-caching t)
  :init
  (projectile-mode t)
  )

;; (setq projectile-keymap-prefix (kbd "C-c C-p"))

(provide 'init-projectile)
;;; Init-projectile.el ends here
