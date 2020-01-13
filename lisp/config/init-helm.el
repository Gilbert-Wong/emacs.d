;;; package --- init-ivy
;;; Commentary:
;;; Code:


(use-package helm-make
  :bind
  (("C-c h m" . 'helm-make)
   ("C-c h l" . 'helm-make-list-target-method)
   ("C-c h f" . 'helm-make-fuzzy-matching)
   )
  :config
  (progn (require 'ansi-color)
         (defun colorize-compilation-buffer ()
           (toggle-read-only)
           (ansi-color-apply-on-region compilation-filter-start (point))
           (toggle-read-only))
         (add-hook 'compilation-filter-hook 'colorize-compilation-buffer))
  :init
  (require 'helm)
  (require 'helm-source)
  )

(provide 'init-helm)
;;; init-helm.el ends here
