;;; package --- init-ivy
;;; Commentary:
;;; Code:

(global-set-key (kbd "M-x") 'counsel-M-x)

(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "C-c f z f") 'counsel-fzf)

(global-set-key (kbd "C-s") 'swiper)

(global-set-key (kbd "C-c C-r") 'ivy-resume)

(global-set-key (kbd "C-c C-i") 'counsel-imenu)

(global-set-key (kbd "C-c C-g") 'counsel-git)


(global-set-key (kbd "C-c C-e") 'hippie-expand)

(global-set-key (kbd "C-c C-b") 'counsel-bookmark)

(global-set-key (kbd "C-c a g") 'counsel-ag)

(global-set-key (kbd "C-c m t") 'counsel-gtags-mode)

(global-set-key (kbd "C-c t s") 'counsel-gtags-find-symbol)

(global-set-key (kbd "C-c t r") 'counsel-gtags-find-reference)

(global-set-key (kbd "C-c t d") 'counsel-gtags-find-definition)

(global-set-key (kbd "C-c t b") 'counsel-gtags-go-backward)

(global-set-key (kbd "C-c t c") 'counsel-gtags-create-tags)

(global-set-key (kbd "C-c t u") 'counsel-gtags-update-tags)

(global-set-key (kbd "C-c t c") 'counsel-gtags-create-tags)

(global-set-key (kbd "C-c t c") 'counsel-gtags-create-tags)

(global-set-key (kbd "C-c C-b") 'counsel-bookmark)

(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "C-h f") 'counsel-describe-function)

(provide 'init-ivy)
;;; init-ivy.el ends here
