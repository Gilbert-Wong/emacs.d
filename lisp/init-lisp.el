;;; init-lisp.el --- Emacs lisp settings, and common config for other lisps -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default debugger-bury-or-kill 'kill)

(require-package 'elisp-slime-nav)
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))
(diminish 'elisp-slime-nav-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq mode-name "ELisp")))

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))


(defun gilbert/headerise-elisp ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (let ((fname (if (buffer-file-name)
                   (file-name-nondirectory (buffer-file-name))
                 (error "This buffer is not visiting a file"))))
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
              ";;; Commentary:\n"
              ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " fname " ends here\n"))))


;; Make C-x C-e run 'eval-region if the region is active

(defun gilbert/eval-last-sexp-or-region (prefix)
  "Eval region from BEG to END if active, otherwise the last sexp."
  (interactive "P")
  (if (and (mark) (use-region-p))
      (eval-region (min (point) (mark)) (max (point) (mark)))
    (pp-eval-last-sexp prefix)))

(global-set-key [remap eval-expression] 'pp-eval-expression)

(with-eval-after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-x C-e") 'gilbert/eval-last-sexp-or-region)
  (define-key emacs-lisp-mode-map (kbd "C-c C-e") 'pp-eval-expression))

(when (maybe-require-package 'ipretty)
  (add-hook 'after-init-hook 'ipretty-mode))


(defun gilbert/make-read-only (expression out-buffer-name)
  "Enable `view-mode' in the output buffer - if any - so it can be closed with `\"q\"."
  (when (get-buffer out-buffer-name)
    (with-current-buffer out-buffer-name
      (view-mode 1))))
(advice-add 'pp-display-expression :after 'gilbert/make-read-only)



(defun gilbert/load-this-file ()
  "Load the current file or buffer.
The current directory is temporarily added to `load-path'.  When
there is no current file, eval the current buffer."
  (interactive)
  (let ((load-path (cons default-directory load-path))
        (file (buffer-file-name)))
    (if file
        (progn
          (save-some-buffers nil (apply-partially 'derived-mode-p 'emacs-lisp-mode))
          (load-file (buffer-file-name))
          (message "Loaded %s" file))
      (eval-buffer)
      (message "Evaluated %s" (current-buffer)))))

(with-eval-after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c C-l") 'gilbert/load-this-file))



(defun gilbert/maybe-set-bundled-elisp-readonly ()
  "If this elisp appears to be part of Emacs, then disallow editing."
  (when (and (buffer-file-name)
             (string-match-p "\\.el\\.gz\\'" (buffer-file-name)))
    (setq buffer-read-only t)
    (view-mode 1)))

(add-hook 'emacs-lisp-mode-hook 'gilbert/maybe-set-bundled-elisp-readonly)


;; Use C-c C-z to toggle between elisp files and an ielm session
;; I might generalise this to ruby etc., or even just adopt the repl-toggle package.

(defvar-local gilbert/repl-original-buffer nil
  "Buffer from which we jumped to this REPL.")

(defvar gilbert/repl-switch-function 'switch-to-buffer-other-window)

(defun gilbert/switch-to-ielm ()
  (interactive)
  (let ((orig-buffer (current-buffer)))
    (if (get-buffer "*ielm*")
        (funcall gilbert/repl-switch-function "*ielm*")
      (ielm))
    (setq gilbert/repl-original-buffer orig-buffer)))

(defun gilbert/repl-switch-back ()
  "Switch back to the buffer from which we reached this REPL."
  (interactive)
  (if gilbert/repl-original-buffer
      (funcall gilbert/repl-switch-function gilbert/repl-original-buffer)
    (error "No original buffer")))

(with-eval-after-load 'elisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c C-z") 'gilbert/switch-to-ielm))
(with-eval-after-load 'ielm
  (define-key ielm-map (kbd "C-c C-z") 'gilbert/repl-switch-back))


;; Hippie-expand

(defun set-up-hippie-expand-for-elisp ()
  "Locally set `hippie-expand' completion functions for use with Emacs Lisp."
  (make-local-variable 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))



;; Automatic byte compilation

(when (maybe-require-package 'auto-compile)
  (setq auto-compile-delete-stray-dest nil)
  (add-hook 'after-init-hook 'auto-compile-on-save-mode)
  (add-hook 'after-init-hook 'auto-compile-on-load-mode))


;; Load .el if newer than corresponding .elc

(setq load-prefer-newer t)



(require-package 'immortal-scratch)
(add-hook 'after-init-hook 'immortal-scratch-mode)


;;; Support byte-compilation in a sub-process, as
;;; required by highlight-cl

(defun gilbert/byte-compile-file-batch (filename)
  "Byte-compile FILENAME in batch mode, ie. a clean sub-process."
  (interactive "fFile to byte-compile in batch mode: ")
  (let ((emacs (car command-line-args)))
    (compile
     (concat
      emacs " "
      (mapconcat
       'shell-quote-argument
       (list "-Q" "-batch" "-f" "batch-byte-compile" filename)
       " ")))))



;; Enable desired features for all lisp modes

(defun gilbert/enable-check-parens-on-save ()
  "Run `check-parens' when the current buffer is saved."
  (add-hook 'after-save-hook #'check-parens nil t))

(defvar gilbert/lispy-modes-hook
  '(enable-paredit-mode
    gilbert/enable-check-parens-on-save)
  "Hook run in all Lisp modes.")


(when (maybe-require-package 'aggressive-indent)
  (add-to-list 'gilbert/lispy-modes-hook 'aggressive-indent-mode))

(defun gilbert/lisp-setup ()
  "Enable features useful in any Lisp mode."
  (run-hooks 'gilbert/lispy-modes-hook))

(defun gilbert/emacs-lisp-setup ()
  "Enable features useful when working with elisp."
  (set-up-hippie-expand-for-elisp))

(defconst gilbert/elispy-modes
  '(emacs-lisp-mode ielm-mode)
  "Major modes relating to elisp.")

(defconst gilbert/lispy-modes
  (append gilbert/elispy-modes
          '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
  "All lispy major modes.")

(require 'derived)

(dolist (hook (mapcar #'derived-mode-hook-name gilbert/lispy-modes))
  (add-hook hook 'gilbert/lisp-setup))

(dolist (hook (mapcar #'derived-mode-hook-name gilbert/elispy-modes))
  (add-hook hook 'gilbert/emacs-lisp-setup))

(when (boundp 'eval-expression-minibuffer-setup-hook)
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode))

(add-to-list 'auto-mode-alist '("\\.emacs-project\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("archive-contents\\'" . emacs-lisp-mode))

(require-package 'cl-lib-highlight)
(with-eval-after-load 'lisp-mode
  (cl-lib-highlight-initialize))


;; Delete .elc files when reverting the .el from VC or magit

;; When .el files are open, we can intercept when they are modified
;; by VC or magit in order to remove .elc files that are likely to
;; be out of sync.

;; This is handy while actively working on elisp files, though
;; obviously it doesn't ensure that unopened files will also have
;; their .elc counterparts removed - VC hooks would be necessary for
;; that.

(defvar gilbert/vc-reverting nil
  "Whether or not VC or Magit is currently reverting buffers.")

(defun gilbert/maybe-remove-elc (&rest _)
  "If reverting from VC, delete any .elc file that will now be out of sync."
  (when gilbert/vc-reverting
    (when (and (eq 'emacs-lisp-mode major-mode)
               buffer-file-name
               (string= "el" (file-name-extension buffer-file-name)))
      (let ((elc (concat buffer-file-name "c")))
        (when (file-exists-p elc)
          (message "Removing out-of-sync elc file %s" (file-name-nondirectory elc))
          (delete-file elc))))))
(advice-add 'revert-buffer :after 'gilbert/maybe-remove-elc)

(defun gilbert/reverting (orig &rest args)
  (let ((gilbert/vc-reverting t))
    (apply orig args)))
(advice-add 'magit-revert-buffers :around 'gilbert/reverting)
(advice-add 'vc-revert-buffer-internal :around 'gilbert/reverting)



(require-package 'macrostep)

(with-eval-after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c x") 'macrostep-expand))



;; A quick way to jump to the definition of a function given its key binding
(global-set-key (kbd "C-h K") 'find-function-on-key)



;; Extras for theme editing
(when (maybe-require-package 'rainbow-mode)
  (defun gilbert/enable-rainbow-mode-if-theme ()
    (when (and (buffer-file-name) (string-match-p "\\(color-theme-\\|-theme\\.el\\)" (buffer-file-name)))
      (rainbow-mode)))
  (add-hook 'emacs-lisp-mode-hook 'gilbert/enable-rainbow-mode-if-theme)
  (add-hook 'help-mode-hook 'rainbow-mode)
  (with-eval-after-load 'rainbow-mode
    (diminish 'rainbow-mode)))



(when (maybe-require-package 'highlight-quoted)
  (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode))


(when (maybe-require-package 'flycheck)
  (require-package 'flycheck-package)
  (with-eval-after-load 'flycheck
    (with-eval-after-load 'elisp-mode
      (flycheck-package-setup))))



;; ERT
(with-eval-after-load 'ert
  (define-key ert-results-mode-map (kbd "g") 'ert-results-rerun-all-tests))


(maybe-require-package 'cl-libify)


(maybe-require-package 'flycheck-relint)



(maybe-require-package 'cask-mode)

(provide 'init-lisp)
;;; init-lisp.el ends here
