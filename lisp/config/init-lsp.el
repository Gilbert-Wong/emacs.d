;;; package --- init-lsp
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :hook (c++-mode . lsp)
  ;; :config
  ;; (setq lsp-erlang-server-install-dir "~/.cache/erlang_ls")
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language


(provide 'init-lsp)
;;; init-lsp.el ends here
