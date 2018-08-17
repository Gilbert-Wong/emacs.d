;;; package --- init
;;; Commentary:
;;; Code:
;;; author gilbert wong, gilbertwong96@icloud.com

(setq gc-cons-threshold (* 1000 1024 1024))

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-misc)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-company)
(require 'init-erlang)
(require 'init-linum-mode)
(require 'init-git)
(require 'init-github)
(require 'init-dictionary)
(require 'init-bookmark)
(require 'init-markdown)
(require 'init-utils)

(when (require 'time-date nil t)
  (message "Emacs startup time: %f seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
;;; init.el ends here
