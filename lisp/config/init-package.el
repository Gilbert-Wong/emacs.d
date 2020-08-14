;;; package --- init-package
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com

;;; Code;

;; set package manage tool
;; (if (eq system-type 'darwin)
;;    (require 'cask)
(require 'cask "~/.cask/cask.el")
(setq after-init-time t)
(cask-initialize)
(setq after-init-time nil)
(setq use-package-always-ensure t)

;; cask manager
;; (use-package pallet
;; 	     :config
;; 	     (pallet-mode t))

(provide 'init-package)
;;; init-package.el ends here

