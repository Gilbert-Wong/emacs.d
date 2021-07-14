;;; init-editing-utils.el --- Support for the Launguage Server Protocol -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'lsp-mode)

(when (maybe-require-package 'lsp-ui)
  (add-hook 'prog-mode-hook 'lsp-ui-mode)
  )

(provide 'init-lsp)
;;; init-lsp.el ends here
