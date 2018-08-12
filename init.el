;;; package init
;;; Commentary:
;;; file emacs
;;; author gilbert wong, gilbertwong96@icloud.com

(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-theme)
(require 'init-misc)
(require 'init-linum-mode)
(require 'init-utils)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
