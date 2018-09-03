;;; package --- init-editorconfig
;;; Commentary:
;;; Code:

(use-package editorconfig
  :ensure t
  :bind
  (("C-M-|" . editorconfig-format-buffer)
   ("C-c f a" . editorconfig-apply)
   ("C-c f d" . editorconfig-display-current-properties))
  :config
  (editorconfig-mode 1))

(provide 'init-editorconfig)
;;; init-editorconfig ends here
