;;; package --- init-elixir
;;; Commentary:
;;; Code:

(require 'elixir-mode)

(require 'dap-elixir)
;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(defvar lsp-elixir--config-options (make-hash-table))

(add-hook 'lsp-after-initialize-hook
          (lambda ()
            (lsp--set-configuration `(:elixirLS, lsp-elixir--config-options))
         ))


(puthash "dialyzerEnabled" :json-false lsp-elixir--config-options)

(provide 'init-elixir)
;;; init-elixir.el ends here
