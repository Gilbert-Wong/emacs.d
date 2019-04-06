;;; package --- init-better-defaults
;;; Commentary:
;;; Code:

(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

;; editorconfig
(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode t))

;; disable ring bell
(setq ring-bell-function 'ignore)

;;$PATH
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  :init
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT" "GOPATH" "EDITOR" "PYTHONPATH"))
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-arguments '("-l" ))
  )

;; ansi-term
(defun open-localhost ()
  (interactive)
  (ansi-term "zsh" "localhost"))

(global-set-key (kbd "C-c C-t") 'open-localhostq)


;; imenu-list
(use-package imenu-list
  :bind
  ("C-'" . 'imenu-list-smart-toggle)
  :custom
  (imenu-list-auto-resize t)
  )


;; hungry-delete
(use-package hungry-delete
  :diminish hungry-delete-mode
  :config
  (global-hungry-delete-mode)
  )

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


;; (global-aggressive-indent-mode 1)


;; change save action default

(use-package super-save
  :diminish super-save-mode
  :config
  (progn
    (setq make-backup-files nil)
    (setq auto-save-default nil)
    (super-save-mode t)
    (setq super-save-auto-save-when-idle t)
    )
  )

;; (setq make-backup-files nil)
;; (setq auto-save-default nil)
;; (super-save-mode t)
;; (setq super-save-auto-save-when-idle t)


(use-package dashboard
  :ensure t
  :config
  (progn  (dashboard-setup-startup-hook)
	      (setq dashboard-banner-logo-title "Gilbert Emacs")
	      (setq dashboard-startup-banner "~/.emacs.d/avatar.png")
	      (setq dashboard-items '((recents . 5)
				                  (bookmarks . 5)
				                  (projects . 5)
				                  ;; (agenda . 5)
				                  ))
	      )
  )

(use-package paredit
  :ensure t
  :bind
  (
   ("<s-backspace>" . 'paredit-forward-slurp-sexp)
   )
  :config
  (dolist (hook (list
                 ;; 'c-mode-common-hook
                 ;; 'c-mode-hook
                 ;; 'c++-mode-hook
                 ;; 'java-mode-hook
                 ;; 'haskell-mode-hook
                 'emacs-lisp-mode-hook
                 'lisp-interaction-mode-hook
                 'lisp-mode-hook
                 'scheme-mode-hook
                 ;; 'maxima-mode-hook
                 ;; 'ielm-mode-hook
                 'sh-mode-hook
                 'makefile-gmake-mode-hook
                 ;; 'php-mode-hook
                 ;; 'python-mode-hook
                 'js-mode-hook
                 ;; 'go-mode-hook
                 ;; 'qml-mode-hook
                 ;; 'jade-mode-hook
                 'css-mode-hook
                 'erlang-mode
                 ;; 'ruby-mode-hook
                 ;; 'coffee-mode-hook
                 ;; 'rust-mode-hook
                 ;; 'qmake-mode-hook
                 ;; 'lua-mode-hook
                 ;; 'swift-mode-hook
                 ;; 'minibuffer-inactive-mode-hook
                 ))
    (add-hook hook '(lambda () (paredit-mode 1)))
    

    (global-page-break-lines-mode))
  )

;;; init-better-defaults ends here
(provide 'init-better-defaults)
