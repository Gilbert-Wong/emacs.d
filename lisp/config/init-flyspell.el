;;; package --- init-better-defaults
;;; Commentary:
;;; Code:

(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(use-package flyspell
  :diminish flyspell-mode
  :bind
  (("C-;" . flyspell-mode))
  )

(provide 'init-flyspell)
;;; init-flyspell ends here