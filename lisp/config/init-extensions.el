;;; package --- init-extensions
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp/extensions" user-emacs-directory))

(add-to-list 'load-path (expand-file-name "lisp/extensions/youtube-dl-emacs" user-emacs-directory))

(require 'color-rg)
(require 'youtube-dl)

(global-set-key (kbd "M-s p") 'color-rg-search-project)

(global-set-key (kbd "M-s d") 'color-rg-search-input)

(provide 'init-extensions)
;;; init-extensions.el ends here
