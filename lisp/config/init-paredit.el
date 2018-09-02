;;; package --- init-paredit
;;; Commentary:
;;; Code:

(use-package paredit
  ;; :diminish paredit-mode
  :defer t
  :bind
  (
   ("C-c s f" . paredit-forward-slurp-sexp)
   ("C-c s b" . paredit-backward-slurp-sexp)
   )
  )

(provide 'init-paredit)
;;; init-paredit.el ends here
