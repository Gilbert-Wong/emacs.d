;;; package --- init-utils
;;; Commentary:
;;; author gilbert wong, gilbertwong96@icloud.com
;;; Code:

(defun hack-emacs ()
  "Hack Emacs Lisp files."
  (interactive)
  (find-file "~/.emacs.d/lisp/"))

(defun format-buffer()
  "Format code."
  (interactive)
  (indent-region (point-min) (point-max) nil)
  )


(provide 'init-utils)
;;; init-utils.el ends here



