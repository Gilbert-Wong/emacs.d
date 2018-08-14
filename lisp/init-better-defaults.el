;;; package --- init-better-defaults
;;; Commentary:
;;; Code:

;; editorconfig
(use-package editorconfig
  :config
  (editorconfig-mode t))

;;$PATH
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  :init
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT" "GOPATH" "EDITOR" "PYTHONPATH"))
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-arguments '("-l" ))
  )

;; indent line
(use-package indent-guide
  :config
  (indent-guide-global-mode))

(global-auto-revert-mode 1)

(use-package flycheck
  :config
  (global-flycheck-mode t))

(global-aggressive-indent-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(provide 'init-better-defaults)
;;; init-better-defaults ends here
