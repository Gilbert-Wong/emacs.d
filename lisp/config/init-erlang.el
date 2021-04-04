;;; package --- init-erlang
;;; Commentary:
;;; Code:

(use-package erlang
  :custom
  (lsp-erlang-server-path "/Users/gilbertwong/.cache/erlang_ls/_build/debug/bin/erlang_ls")
  :hook (erlang-mode . lsp)
  :config
  (add-hook 'erlang-mode-hook #'lsp)
  (add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode))
  (require 'erlang-start)
  )

(provide 'init-erlang)
;;; init-erlang.el ends here
