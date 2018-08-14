
;;; package --- misc
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com
;;; Code:

(if (eq system-type 'darwin)
    (global-set-key (kbd "C-c b m") 'browse-url-default-macosx-browser))
(global-set-key (kbd "C-c b f") 'browse-url-firefox)
(global-set-key (kbd "C-c b c") 'browse-url-chrome)

;; iedit mode
(global-set-key (kbd "C-c m u") 'iedit-mode)

;; neotree
(use-package neotree
  :bind
  ("C-c n s". 'neotree-toggle)
  :custom
  (neo-window-fixed-size nil)
  )
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; window-numbering
(window-numbering-mode t)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;; which-key
(which-key-mode 1)

;; ggtags-mode
(global-set-key (kbd "C-c m g") 'ggtags-mode)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

(smartparens-global-mode t)

(global-undo-tree-mode t)

(provide 'init-misc)
;;; init-misc.el ends here
