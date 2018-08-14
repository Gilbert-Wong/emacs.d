;;; package --- popwin
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com
;;; Code:

(popwin-mode t)

;; undo-tree
(push '("*undo-tree*" :height 0.2 :position bottom) popwin:special-display-config)

;; flycheck errors
(push '("*Flycheck errors*" :height 0.2 :position bottom) popwin:special-display-config)
(provide 'init-popwin)
;;; init-popwin.el ends here
