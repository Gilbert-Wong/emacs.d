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
  (setq exec-path-from-shell-variables '("PATH"
                                         "MANPATH"
                                         "GOROOT"
                                         "GOPATH"
                                         "EDITOR"
                                         "PYTHONPATH"))
  (setenv "GOPATH" "/Users/gilbertwong/Development/gocode")
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-arguments '("-l" ))
  )

;; ansi-term
(defun open-localhost ()
  (interactive)
  (ansi-term "zsh" "localhost"))

(global-set-key (kbd "C-c C-t") 'open-localhostq)

(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)


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
  :hook (prog-mode . flycheck-mode))


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

(global-set-key (kbd "M-p") 'paredit-mode)

(use-package paredit
  :diminish paredit-mode
  :ensure t
  :bind
  ("<s-backspace>" . 'paredit-forward-slurp-sexp)
  
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

;; yasnippet config
(require 'yasnippet)
(yas-global-mode 1)

;; protobuf mode
(require 'protobuf-mode)

;; fix 'Listing directory failed but `access-file` worked'
;; (setq ls-lisp-use-insert-directory-program nil)
;; (require 'ls-lisp)

;;; init-better-defaults ends here
(provide 'init-better-defaults)
;;; init-better-defaults.el ends here
