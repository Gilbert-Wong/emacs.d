;;; package --- init-package
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com

;;; Code;

;; set package manage tool
;; (if (eq system-type 'darwin)
;;    (require 'cask)
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(setq use-package-always-ensure t)

;; cask manager
(use-package pallet
	     :config
	     (pallet-mode t))

(provide 'init-package)
;;; init-package.el ends here

