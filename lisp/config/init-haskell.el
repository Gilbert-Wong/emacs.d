;;; package --- init-erlang
;;; Commentary:
;;; Code:

(use-package haskell-mode
  :defer t
  :hook ((haskell-mode . subword-mode)
         (haskell-mode . eldoc-mode)
         (haskell-cabal-mode. subword-mode)
         (haskell-mode . turn-on-haskell-intentation)
         (haskell-mode . haskell-auto-insert-module-template)
         (haskell-mode . hindent-mode)
         (haskell-mode . stack-exec-path-mode)
         )
  :bind (
         ("C-c C-l" . intero-restart)
         ("C-c h h" . hoogle)
         ("C-c o" . open-line)
         )
  )


(use-package intero
  :defer t
  :config
  (flycheck-add-next-checker 'intero
                             '(warning . haskell-hlint))
  )

(use-package dhall-mode
  :defer t
  :hook (dhall-mode . stack-exec-path-mode)
  )


(define-minor-mode stack-exec-path-mode
  "If this is a stack project, set `exec-path' to the path \"stack exec\" would use."
  nil
  :lighter ""
  :global nil
  (if stack-exec-path-mode
      (when (and (executable-find "stack")
                 (locate-dominating-file default-directory "stack.yaml"))
        (setq-local
         exec-path
         (seq-uniq
          (append (list (concat (string-trim-right (shell-command-to-string "stack path --local-install-root")) "/bin"))
                  (parse-colon-path
                   (replace-regexp-in-string "[\r\n]+\\'" ""
                                             (shell-command-to-string "stack path --bin-path"))))
          'string-equal))
                                        ;(add-to-list (make-local-variable 'process-environment) (format "PATH=%s" (string-join exec-path path-separator)))
        )
(kill-local-variable 'exec-path)))

(provide 'init-haskell)
;;; init-haskell.el ends here
