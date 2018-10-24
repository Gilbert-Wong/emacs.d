;;; package --- init-erlang
;;; Commentary:
;;; Code:

;; (setq flymake-log-level 3) ;; log is annoying

(require 'erlang-start)

;; (use-package flycheck
;;   :config
;;   (flycheck-define-checker erlang-otp
;;     "An Erlang syntax checker using the Erlang interpreter."
;;     :command ("make" "-C" (eval (projectile-project-root)))
;;     ;; :command ("erlc" "-o" temporary-directory "-Wall"
;;     ;;           "-I" "../include" "-I" "../../include"
;;     ;;           "-I" "../../../include" source)
;;     :modes erlang-mode
;;     :error-patterns
;;     ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
;;      (error line-start (file-name) ":" line ": " (message) line-end))
;;     )
;;   )

;; (add-hook 'erlang-mode-hook
;;           (lambda ()
;;             (flycheck-select-checker 'erlang-otp)
;;             (flycheck-mode)))
(use-package indy
  :ensure t
  :config
  (setq indy-rules '(
                     (erlang-mode . (
                                     ((and (indy--current 'indy--starts-with "end")
                                           (indy--prev 'indy--ends-on ") ->"))
                                      (indy--prev-tab))
                                     ((indy--current 'indy--starts-with "end") (indy--prev-tab -1))
                                     ((indy--prev 'indy--ends-on ") ->")       (indy--prev-tab 1))
                                     ((indy--current 'indy--starts-with "]")   (indy--prev-tab -1))
                                     ((indy--prev 'indy--ends-on "[")          (indy--prev-tab 1))
                                     ((indy--prev 'indy--ends-on ",")          (indy--prev-tab))
                                     ))
                     )))


(use-package ivy-erlang-complete
  :custom
  (ivy-erlang-complete-erlang-root "/usr/local/cellar/erlang/")
  :config
  (progn (add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
	     (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
	     (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
	     (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode)))
  :bind
  (
   ("C-c e s" . 'ivy-erlang-complete-find-spec)
   ("C-c e f" . 'ivy-erlang-complete-find-file)
   ("C-c e h" . 'ivy-erlang-complete-show-doc-at-point)
   ("C-c e p" . 'ivy-erlang-complete-set-project-root)
   ("C-c e a" . 'ivy-erlang-complete-autosetup-project-root)
   )
  :init
  (add-hook 'erlang-mode-hook #'ivy-erlang-complete-init)
  (add-hook 'after-save-hook #'ivy-erlang-complete-reparse)
  (add-hook 'erlang-mode-hook #'company-erlang-init)
  )

(provide 'init-erlang)
;;; init-erlang.el ends here
