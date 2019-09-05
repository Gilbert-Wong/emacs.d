;;; package --- init-erlang
;;; Commentary:
;;; Code:

;; (setq flymake-log-level 3) ;; log is annoying
(use-package rust-mode
  :hook (erlang-mode . lsp))
;; (use-package ivy-erlang-complete
;;   :custom
;;   (ivy-erlang-complete-erlang-root "/usr/local/cellar/erlang/")
;;   :config
;;   (progn
;;     ;; (add-hook 'erlang-mode-hook
;;     ;;           '(lambda ()
;;     ;;              (set (make-local-variable 'company-backends)
;;     ;;                   '((company-erlang))
;;     ;;                   )
;;     ;;              (set (make-local-variable 'company-minimum-prefix-length)
;;     ;;                   3)
;;     ;;              ))
;;     (add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
;;     (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
;;     (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
;;     (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode)))
;;   :bind
;;   (
;;    ("C-;" . 'ivy-erlang-complete)
;;    ("C-c d p" . 'dash-at-point)
;;    ("C-c e s" . 'ivy-erlang-complete-find-spec)
;;    ("C-c e f" . 'ivy-erlang-complete-find-file)
;;    ("C-c e h" . 'ivy-erlang-complete-show-doc-at-point)
;;    ("C-c e p" . 'ivy-erlang-complete-set-project-root)
;;    ("C-c e a" . 'ivy-erlang-complete-autosetup-project-root))
;;   :init
;;   (require 'erlang-start)
;;   (add-hook 'erlang-mode-hook #'ivy-erlang-complete-init)
;;   (add-hook 'after-save-hook #'ivy-erlang-complete-reparse)
;;   )

(provide 'init-erlang)
;;; init-erlang.el ends here
