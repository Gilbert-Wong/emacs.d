;;; init-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'hide-mode-line)

(when (require-package 'vterm)
  ;; (add-hook 'vterm-mode-hook #'hide-mode-line-mode)
  )

(provide 'init-vterm)
;;; init-utils.el ends here
