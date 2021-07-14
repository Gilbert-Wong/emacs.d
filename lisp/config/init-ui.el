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
  ;; (all-the-icons-insert-icons-for 'alltheicons)
  (mode-icons-mode t)
  )

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

;; hide menu bar
(menu-bar-mode -1)

;; hide scroll bar
(scroll-bar-mode -1)
(fringe-mode -1)

(setq inhibit-startup-message t)
;; (setq default-frame-scroll-bars 0)
;; font config
(set-frame-font "Iosevka 14")
;;(setq default-frame-alist '((font . "Inziu Monaco SC 16")))
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(font . "Iosevka 14"))
;; (font . "Inziu Monaco SC 16")

(use-package dashboard
  :ensure t
  :config
  (progn  (dashboard-setup-startup-hook)
	      (setq dashboard-banner-logo-title "Gilbert Emacs")
	      ;; (setq dashboard-startup-banner "~/.emacs.d/GilbertAvatar.png")
	      (setq dashboard-items '((recents . 5)
				                  (bookmarks . 5)
				                  (projects . 5)
				                  ;; (agenda . 5)
				                  ))
	      )
  )

(setq company-box-icons-unknown 'fa_question_circle)

(setq company-box-icons-elisp
   '((fa_tag :face font-lock-function-name-face) ;; Function
     (fa_cog :face font-lock-variable-name-face) ;; Variable
     (fa_cube :face font-lock-constant-face) ;; Feature
     (md_color_lens :face font-lock-doc-face))) ;; Face

(setq company-box-icons-yasnippet 'fa_bookmark)

(setq company-box-icons-lsp
      '((1 . fa_text_height) ;; Text
        (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
        (3 . (fa_tag :face font-lock-function-name-face)) ;; Function
        (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
        (5 . (fa_cog :foreground "#FF9800")) ;; Field
        (6 . (fa_cog :foreground "#FF9800")) ;; Variable
        (7 . (fa_cube :foreground "#7C4DFF")) ;; Class
        (8 . (fa_cube :foreground "#7C4DFF")) ;; Interface
        (9 . (fa_cube :foreground "#7C4DFF")) ;; Module
        (10 . (fa_cog :foreground "#FF9800")) ;; Property
        (11 . md_settings_system_daydream) ;; Unit
        (12 . (fa_cog :foreground "#FF9800")) ;; Value
        (13 . (md_storage :face font-lock-type-face)) ;; Enum
        (14 . (md_closed_caption :foreground "#009688")) ;; Keyword
        (15 . md_closed_caption) ;; Snippet
        (16 . (md_color_lens :face font-lock-doc-face)) ;; Color
        (17 . fa_file_text_o) ;; File
        (18 . md_refresh) ;; Reference
        (19 . fa_folder_open) ;; Folder
        (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
        (21 . (fa_square :face font-lock-constant-face)) ;; Constant
        (22 . (fa_cube :face font-lock-type-face)) ;; Struct
        (23 . fa_calendar) ;; Event
        (24 . fa_square_o) ;; Operator
        (25 . fa_arrows)) ;; TypeParameter
      )

(provide 'init-ui)
;;; init-ui.el ends here
