;;; package --- init-go
;;; Commentary:
;;; Code:

(setenv "GOPATH" "~/go/src")

(defun gilbert/go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ;; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  )

(add-hook 'go-mode-hook 'gilbert/go-mode-hook)

(use-package company-go
  :hook
  (go-mode . (lambda ()
                     (set (make-local-variable 'company-backends) '(company-go))
                     (company-mode)))
  :config
  (progn (setq company-tooltip-limit 20)
         ;; bigger popup window
         (setq company-idle-delay .3)
         ;; decrease delay before autocompletion popup shows
         (setq company-echo-delay 0)
         ;; remove annoying blinking
         (setq company-begin-commands '(self-insert-command))
         ;; start autocompletion only after typing)
  )

(provide 'init-go)
;;; init-go.el ends here
