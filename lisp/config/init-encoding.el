;;; package --- init-encoding
;;; Commentary:
;;; Code:

(set-language-environment "UTF-8")

(set-default-coding-systems 'utf-8)

(set-buffer-file-coding-system 'utf-8-unix)

(set-clipboard-coding-system 'utf-8-unix)

(set-file-name-coding-system 'utf-8-unix)

(set-keyboard-coding-system 'utf-8-unix)

(set-next-selection-coding-system 'utf-8-unix)

(set-selection-coding-system 'utf-8-unix)

(set-terminal-coding-system 'utf-8-unix)

(setq locale-coding-system 'utf-8)

(prefer-coding-system 'utf-8)

(provide 'init-company)
;;; init-encoding.el ends here
