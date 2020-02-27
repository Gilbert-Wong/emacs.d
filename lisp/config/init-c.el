;;; package --- init-c
;;; Commentary:
;;; Code:

;; (use-package helm-cscope
;;   :config
;;   (add-hook 'c-mode-common-hook 'helm-cscope-mode)
;;   (add-hook 'helm-cscope-mode-hook
;;             (lambda ()
;;               (local-set-key (kbd "M-.") 'helm-cscope-find-global-definition)
;;               (local-set-key (kbd "M-@") 'helm-cscope-find-calling-this-function)
;;               (local-set-key (kbd "M-s") 'helm-cscope-find-this-symbol)
;;               (local-set-key (kbd "M-,") 'helm-cscope-pop-mark))))

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(provide 'init-c)
;;; init-c.el ends here
