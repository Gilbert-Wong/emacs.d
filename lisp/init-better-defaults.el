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

(setq x-select-enable-clipboard t)

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package flycheck
  :config
  (global-flycheck-mode t))


(smartparens-global-mode t)

(global-undo-tree-mode t)

(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
               (display-buffer-reuse-window
		display-buffer-in-side-window)
               (side            . bottom)
               (reusable-frames . visible)
               (window-height   . 0.2))


	     )

(add-to-list 'display-buffer-alist '(("\\*undo-tree\\*" display-buffer-below-selected)))

(global-aggressive-indent-mode 1)


;; change save action default
(setq make-backup-files nil)
(setq auto-save-default nil)
(super-save-mode t)
(setq super-save-auto-save-when-idle t)


(use-package dashboard
  :ensure t
  :config
  (progn  (dashboard-setup-startup-hook)
	  (setq dashboard-banner-logo-title "Gilbert Emacs")
	  (setq dashboard-startup-banner 'logo)
	  (setq dashboard-items '((recents . 5)
				  (bookmarks . 5)
				  (projects . 5)
				  (agenda . 5)))
	  )
  )

(page-break-lines-mode)

(provide 'init-better-defaults)
;;; init-better-defaults ends here
