;;; package --- init-erlang
;;; Commentary:
;;; Code:

;; git-gutter.el

(use-package git-gutter
  :diminish git-gutter-mode
  :config
  (global-git-gutter-mode +1)
  :custom
  (git-gutter:update-interval 2)
  (git-gutter:modified-sign " ")
  (git-gutter:added-sign "+")
  (git-gutter:deleted-sign "-")
  )


;; (custom-set-variables
;;  '(git-gutter:update-interval 2)

;;  '(git-gutter:modified-sign " ") ;; one space
;;  '(git-gutter:added-sign "+")    ;; multiple character is OK
;;  '(git-gutter:deleted-sign "-"))

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

;; magit
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
(global-set-key (kbd "C-c g g") 'magit-blame)

(provide 'init-git)
;;; init-git.el ends here
