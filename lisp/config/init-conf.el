;;; package --- init-conf
;;; Commentary:
;;; Code:

(use-package yaml-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  )

;; (setq projectile-keymap-prefix (kbd "C-c C-p"))

(provide 'init-conf)
;;; Init-conf.el ends here
