;;; package --- init-company
;;; Commentary:
;;; Code:

(use-package company
  :defer N
  :init
  (global-company-mode t)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.08)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (setq company-require-match nil)
  (setq company-dabbrev-downcase nil)

  (add-to-list 'company-backends '(company-keywords
                                   company-files
                                   company-abbrev
                                   company-yasnippet
                                   company-dabbrev
                                   company-gtags
                                   company-etags
                                   company-eclim
                                   company-elisp))

  (add-hook 'emacs-lisp-hook
	        (lambda()
              (setq (make-local-variable 'company-backends)
                    '(company-elisp
                      company-yasnippet
                      company-abbrev
                      company-dabbrev))))
  )

(use-package company-box
  :diminish company-box-mode
  :hook (company-mode . company-box-mode))

(use-package company-lsp
  :after (company lsp-mode)
  :config
  (push 'company-lsp company-backends)
  (pu)
  :commands company-lsp
  :ensure t)

(provide 'init-company)
;;; init-company.el ends here
