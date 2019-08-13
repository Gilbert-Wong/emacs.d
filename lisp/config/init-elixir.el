;;; package --- init-elixir
;;; Commentary:
;;; Code:

(require 'elixir-mode)

(use-package alchemist
  :init
  (setq alchemist-mix-command "/usr/local/bin/mix")
  (setq alchemist-mix-test-task "espec")
  (setq alchemist-hooks-test-on-save t)
  (setq alchemist-hooks-compile-on-save t)
  )

;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))


(provide 'init-elixir)
;;; init-elixir.el ends here
