;;; package init
;;; Commentary:
;;; file emacs
;;; author gilbert wong, gilbertwong96@icloud.com

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
