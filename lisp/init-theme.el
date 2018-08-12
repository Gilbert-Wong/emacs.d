;;; packages init-theme
;;; Commentary: appearance definition
;;; author gilbert wong, gilbertwong96@icloud.com


;; Code

(use-package highlight-parentheses
	     :config
	     (global-highlight-parentheses-mode t))

(use-package all-the-icons
	     :config
	     (mode-icons-mode t))

(use-package popwin
	     :config
	     (popwin-mode t))

(use-package gruvbox-theme)

;; set cursor color in dark theme
(set-cursor-color "White")
(setq-default cursor-type 'bar)

;; hide tool bar
(if window-system
    (tool-bar-mode 0))

;; hide scroll bar
(scroll-bar-mode 0)
(fringe-mode 0)

;; show line number
(global-linum-mode t)
(column-number-mode t)

(setq inhibit-startup-message t)

;; font config
(set-default-font "Inziu Iosevka SC 16")

(setq neo-theme (if window-system 'icons 'arrow))

(provide 'init-theme)

;;; init-theme.el ends here
