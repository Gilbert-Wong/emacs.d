;;; init-erlang.el --- Support for the Erlang language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'erlang)
  (add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode))
  (require 'erlang-start))

(when (maybe-require-package 'lsp-mode)
  (add-hook 'erlang-mode-hook #'lsp)
  )

(provide 'init-erlang)
;;; init-erlang.el ends here
