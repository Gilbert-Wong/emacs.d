;;; package --- init-bookmark
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-c b m") 'bm-toggle)
(global-set-key (kbd "C-c b l") 'bm-show-all)
(global-set-key (kbd "C-c b n") 'bm-next)
(global-set-key (kbd "C-c b p") 'bm-previous)
(global-set-key (kbd "C-c b a") 'bm-bookmark-annotate)

(provide 'init-bookmark)
;;; init-bookmark.el ends here
