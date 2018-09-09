;;; package --- init-plantuml
;;; Commentary:
;;; Code:

(use-package plantuml-mode
  :custom
  (plantuml-jar-path "/usr/local/Cellar/plantuml/1.2018.10/libexec/plantuml.jar")
  :config
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
  )

(with-eval-after-load 'flycheck
  (require 'flycheck-plantuml)
  (flycheck-plantuml-setup))

(defun ns-yank-image-at-point-as-image ()
    "Yank the image at point to the X11 clipboard as image/png."
    (interactive)
    (let ((image (get-text-property (point) 'display)))
      (if (eq (car image) 'image)
          (let ((data (plist-get (cdr image) ':data))
                (file (plist-get (cdr image) ':file)))
            (cond (data
                   (with-temp-buffer
                     (insert data)
                     (call-shell-region
                      (point-min) (point-max)
                      "impbcopy")))     ;; http://www.alecjacobson.com/weblog/?p=3816 Linux x11: https://emacs.stackexchange.com/questions/41016/how-can-i-yank-images-from-emacs?noredirect=1#comment64407_41016
                  (file
                   (if (file-exists-p file)
                       (start-process
                        "_" nil "impbcopy"  (file-truename file))))
                  (t
                   (message "The image seems to be malformed."))))
        (message "Point is not at an image."))))

(provide 'init-plantuml)
;;; init-plantuml.el ends here
