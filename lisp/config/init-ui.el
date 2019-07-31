;;; package --- init-ui
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com
;;; Code:

(global-hl-line-mode t)

(use-package highlight-parentheses
  :diminish highlight-parentheses-mode
  :config
  (global-highlight-parentheses-mode t))

(use-package all-the-icons
  :config
  (mode-icons-mode t))

(use-package popwin)

(use-package gruvbox-theme
  :ensure t
  :config
  ;; (load-theme 'solarized-light t)
  ;; (load-theme 'dracula t)
  (load-theme 'gruvbox-dark-medium t)
  )

;; set cursor color in dark theme
;; (set-cursor-color "White")
(setq-default cursor-type 'bar)

;; show column number
(column-number-mode t)


;; hide tool bar
(if window-system
    (tool-bar-mode -1))

;; hide scroll bar
(scroll-bar-mode -1)
(fringe-mode -1)

(setq inhibit-startup-message t)

;; (setq default-frame-scroll-bars 0)
;; font config
(set-frame-font "Inziu Iosevka SC 20")
;;(setq default-frame-alist '((font . "Inziu Iosevka SC 16")))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(font . "Inziu Iosevka SC 16"))
;; (font . "Inziu Iosevka SC 16")

(provide 'init-ui)
;;; init-ui.el ends here
