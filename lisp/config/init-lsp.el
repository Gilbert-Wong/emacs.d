;;; package --- init-lsp
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :hook ((c++-mode . lsp)
         (elixir-mode . lsp)
         (lsp-origami-mode . lsp))
  :ensure t
  :commands lsp
  :config (require 'lsp-clients)
  :init
  (add-to-list 'exec-path "~/.cache/elixir-ls/release")
  
  )

;; optionally
(use-package lsp-ui
  :after (lsp-mode)
  :ensure t
  :commands lsp-ui-mode
  :config (progn (define-key lsp-ui-mode-map [remap xref-find-definitions]
                   #'lsp-ui-peek-find-definitions)
                 (define-key lsp-ui-mode-map [remap xref-find-references]
                   #'lsp-ui-peek-find-references))
  )

(dap-ui-mode)
(dap-mode)

(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language


(provide 'init-lsp)
;;; init-lsp.el ends here
