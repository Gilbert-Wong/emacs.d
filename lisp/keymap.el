;;; package
;;; Commentary:
;;; file emacs
;;; author gilbert wong, gilbertwong96@icloud.com

;;; Code;

(defun format-buffer ()
  "format full buffer"
  (interactive)
  (indent-region (point-min) (point-max) nil))
