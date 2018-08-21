
;;; package --- init-ui
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com
;;; Code:

(use-package highlight-parentheses
  :diminish highlight-parentheses-mode
  :config
  (global-highlight-parentheses-mode t))

(use-package all-the-icons
  :config
  (mode-icons-mode t))

(use-package popwin)


(use-package solarized-theme
  :ensure t
  :init
   (load-theme 'solarized-light t)
  )

;; set cursor color in dark theme
;; (set-cursor-color "White")
(setq-default cursor-type 'bar)

;; show column number
(column-number-mode t)


;; hide tool bar
(if window-system
    (tool-bar-mode 0))

;; hide scroll bar
(scroll-bar-mode 0)
(fringe-mode 0)

(setq inhibit-startup-message t)

;; (setq default-frame-scroll-bars 0)
;; font config
(set-frame-font "Inziu Iosevka SC 16")
;;(setq default-frame-alist '((font . "Inziu Iosevka SC 16")))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(font . "Inziu Iosevka SC 16"))
;; (font . "Inziu Iosevka SC 16")



(provide 'init-ui)
;;; init-ui.el ends here
