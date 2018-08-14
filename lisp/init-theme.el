;;; package --- init-theme
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com
;;; Code:

(use-package all-the-icons)

(use-package highlight-parentheses
  :config
  (global-highlight-parentheses-mode t))

;; (use-package all-the-icons
;;	     :config
;;  	     (mode-icons-mode t))

(use-package popwin
	     :config
	     (popwin-mode t))

(use-package gruvbox-theme)

;; (use-package solarized-theme)

;; set cursor color in dark theme
(set-cursor-color "White")
(setq-default cursor-type 'bar)

;; show column number
(column-number-mode t)


;; hide tool bar
(if window-system
    (tool-bar-mode 0))

;; hide scroll bar
(scroll-bar-mode 0)
(fringe-mode 0)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(setq inhibit-startup-message t)

;; font config
(set-default-font "Inziu Iosevka SC 16")

(provide 'init-theme)
;;; init-theme.el ends here
