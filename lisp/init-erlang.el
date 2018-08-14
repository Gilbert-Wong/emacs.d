;;; package --- init-erlang
;;; Commentary:
;;; Code:

;; (setq flymake-log-level 3) ;; log is annoying

(require 'erlang-start)

(use-package flycheck
  :config
  (flycheck-define-checker erlang-otp
    "An Erlang syntax checker using the Erlang interpreter."
    :command ("erlc" "-o" temporary-directory "-Wall"
              "-I" "../include" "-I" "../../include"
              "-I" "../../../include" source)
    :modes erlang-mode
    :error-patterns
    ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
     (error line-start (file-name) ":" line ": " (message) line-end))
    )
  )

(use-package ivy-erlang-complete--base
  :hook
  ((erlang-mode . ivy-erlang-complete-init)
   (erlang-mode . company-erlang-init)
   (erlang-mode . ivy-erlang-complete-reparse))
  :config
  ((add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
   (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
   (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
   (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode)))
  :bind
  (
   ("C-c e d" . 'ivy-erlang-complete-find-definition)
   ("C-c e s" . 'ivy-erlang-complete-find-spec)
   ("C-c e r" . 'ivy-erlang-complete-find-references)
   ("C-c e f" . 'ivy-erlang-complete-find-file)
   ("C-c e h" . 'ivy-erlang-complete-show-doc-at-point)
   ("C-c e p" . 'ivy-erlang-complete-set-project-root)
   ("C-c e a" . 'ivy-erlang-complete-autosetup-project-root)
   )
  )


(provide 'init-erlang)
;;; init-erlang.el ends here
