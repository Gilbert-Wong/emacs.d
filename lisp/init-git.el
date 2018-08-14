;;; package --- init-erlang
;;; Commentary:
;;; Code:

;; git 相关
(global-set-key (kbd "C-c g c") 'magit-commit)
(global-set-key (kbd "C-c g p") 'magit-push)
(global-set-key (kbd "C-c g f") 'magit-pull)
(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g d") 'magit-diff)
(global-set-key (kbd "C-c g o") 'magit-checkout)
(global-set-key (kbd "C-c g b") 'magit-branch)
(global-set-key (kbd "C-c g l") 'magit-log-all)
(global-set-key (kbd "C-c g m") 'magit-merge)
(global-set-key (kbd "C-c g r") 'magit-rebase)
(global-set-key (kbd "C-c g v") 'magit-revert)
(global-set-key (kbd "C-c g e") 'magit-rebase)

(provide 'init-git)
;;; init-git.el ends here
