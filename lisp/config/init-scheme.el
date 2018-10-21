;;; package --- init-scheme
;;; Commentary:
;;; Code:

(require 'cmuscheme)

(setq scheme-program-name "chez")         ;; if use mit-scheme then "scheme"
(setq geiser-chez-binary "chez")

(setq geiser-active-implementations '(chez))

(setq geiser-mode-eval-last-sexp-to-buffer t)

(setq geiser-mode-eval-to-buffer-prefix "\n;;=> ")

(setq geiser-mode-start-repl-p t)


;; (defun gilbert/get-scheme-proc-create ()
;;   "Create one scheme process if no one is created."
;;   (unless (and scheme-buffer
;;                (get-buffer scheme-buffer)
;;                (comint-check-proc scheme-buffer))
;;     (save-window-excursion
;;       (run-scheme scheme-program-name))))

;; (defun gilbert/scheme-send-last-sexp ()
;;   "A replacement of original `scheme-send-last-sexp`:
;; 1. check if scheme process exists, otherwise create one
;; 2. make sure the frame is splitted into two windows, current 
;; one is the scheme source code window, the other one is the 
;; scheme process window
;; 3. run `scheme-send-last-sexp`
;;   PS: this function is copied from kelvin and inspired by Wang Yin."
;;   (interactive)
;;   (gilbert/get-scheme-proc-create)
;;   (cond ((= 2 (count-windows))
;;          (other-window 1)
;;          (unless (string= (buffer-name)
;;                           scheme-buffer)
;;            (switch-to-buffer scheme-buffer))
;;          (other-window 1))
;;         (t
;;          (delete-other-windows)
;;          (split-window-vertically (floor (* 0.68 (windows-height))))
;;          (other-window 1)
;;          (switch-to-buffer scheme-buffer)
;;          (other-window 1)))
;;   (scheme-send-last-sexp))

;; (setq scheme-program-name "chez-scheme")

;; (gilbert/add-hook '(scheme-mode-hook)
;;                   '((lambda ()
;;                       (local-set-key (kbd "C-x C-e") 'gilbert/scheme-send-last-sexp))))

;; (add-hook 'scheme-mode-hook
;;   (lambda ()
;;     (paredit-mode 1)
;;     (define-key scheme-mode-map (kbd "C-c s e") 'scheme-send-last-sexp-split-window)
;;     (define-key scheme-mode-map (kbd "C-c s d") 'scheme-send-definition-split-window)))

(provide 'init-scheme)
;;; init-scheme.el ends here
