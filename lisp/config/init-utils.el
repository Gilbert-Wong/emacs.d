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

(defun spacemacs/dos2unix ()
  "Convert the current buffer to UNIX file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))

(defun spacemacs/unix2dos ()
  "Convert the current buffer to DOS file format."
  (interactive)
  (set-buffer-file-coding-system 'undecided-dos nil))

(defun mac-switch-meta nil
  "Switch meta between Option and Command."
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	)
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      )
    )
  )

(defun open-in-external-app ()
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference."
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" $fpath t t))) $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

(defun show-in-desktop()
  "Show current file in desktop.
 (Mac Finder, Windows Explorer, Linux file manager)
 This command can be called when in a file or in `dired'."
  (interactive)
  (let (($path (if (buffer-file-name) (buffer-file-name) default-directory )))
    (cond
     ((string-equal system-type "windows-nt")
      (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" $path t t)))
     ((string-equal system-type "darwin")
      (if (eq major-mode 'dired-mode)
          (let (($files (dired-get-marked-files )))
            (if (eq (length $files) 0)
                (shell-command
                 (concat "open " (shell-quote-argument default-directory)))
              (shell-command
               (concat "open -R " (shell-quote-argument (car (dired-get-marked-files )))))))
        (shell-command
         (concat "open -R " $path))))
     ((string-equal system-type "gnu/linux")
      (let (
            (process-connection-type nil)
            (openFileProgram (if (file-exists-p "/usr/bin/gvfs-open")
                                 "/usr/bin/gvfs-open"
                               "/usr/bin/xdg-open")))
        (start-process "" nil openFileProgram $path))
      ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. eg with nautilus
      ))))

(defun open-in-terminal()
  "Open the current dir in a new terminal window."
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (message "Microsoft Windows not supported. File a bug report or pull request."))
   ((string-equal system-type "darwin")
    (let ((process-connection-type nil))
      (start-process "" nil "/Applications/iTerm.app/Contents/MacOS/iTerm2" default-directory)))
   ((string-equal system-type "gnu/linux")
    (let ((process-connection-type nil))
      (start-process "" nil "x-terminal-emulator"
                     (concat "--working-directory=" default-directory))))))


(defun open-in-textedit()
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (format "open -a TextEdit.app \"%s\"" $fpath))) $file-list))))))


(defun open-in-chrome()
  "Open the current file or `dired' marked files in Mac's chrome browser."
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (when (buffer-modified-p )
             (save-buffer))
           (shell-command
            (format "open -a Google\ Chrome.app \"%s\"" $fpath))) $file-list)))))
  )

(defun copy-file-path (&optional @dir-path-only-p)
  "Copy the current buffer's file path or dired path to `kill-ring'.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the file/dir cursor is on, or marked files.

If a buffer is not file and not dired, copy value of `default-directory' (which is usually the “current” dir when that buffer was created)"

  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))

(defun cleanup-recentf ()
  (progn
    (and (fboundp 'recentf-cleanup)
         (recentf-cleanup))))

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


(defun word-count-for-chinese ()

  "「较准确地」统计中/日/英文字数。
- 文章中的注解不算在字数内。
- 平假名与片假名亦包含在「中日文字数」內，每个平/片假名都算单独一个字（但片假
  名不含连音「ー」）。
- 英文只计算「单字数」，不含标点。
- 韩文不包含在內。
※计算标准太多种了，例如英文标点是否算入、以及可能有不太常用的标点符号没算入等
。且中日文标点的计算标准要看 Emacs 如何定义特殊标点符号如ヴァランタン・アルカン
中间的点也被 Emacs 算为一个字而不是标点符号。"
  (interactive)
  (let* ((v-buffer-string
          (progn
            (if (eq major-mode 'org-mode) ; 去掉 org 文件的 OPTIONS（以#+开头）
                (setq v-buffer-string (replace-regexp-in-string "^#\\+.+" ""
                                                                (buffer-substring-no-properties (point-min) (point-max))))
              (setq v-buffer-string (buffer-substring-no-properties (point-min) (point-max))))
            (replace-regexp-in-string (format "^ *%s *.+" comment-start) "" v-buffer-string)))
                                        ; 把注解行刪掉（不把注解算进字数）。
         (chinese-char-and-punc 0)
         (chinese-punc 0)
         (english-word 0)
         (chinese-char 0))
    (with-temp-buffer
      (insert v-buffer-string)
      (goto-char (point-min))
      ;; 中文（含标点、片假名）
      (while (re-search-forward wc-regexp-chinese-char-and-punc nil :no-error)
        (setq chinese-char-and-punc (1+ chinese-char-and-punc)))
      ;; 中文标点符号
      (goto-char (point-min))
      (while (re-search-forward wc-regexp-chinese-punc nil :no-error)
        (setq chinese-punc (1+ chinese-punc)))
      ;; 英文字数（不含标点）
      (goto-char (point-min))
      (while (re-search-forward wc-regexp-english-word nil :no-error)
        (setq english-word (1+ english-word))))
    (setq chinese-char (- chinese-char-and-punc chinese-punc))
    (message
     (format "中日文字数（不含标点）：%s
中日文字数（包含标点）：%s
英文字数（不含标点）：%s
=======================
中英文合计（不含标点）：%s"
             chinese-char chinese-char-and-punc english-word
             (+ chinese-char english-word)))))

(defun show-current-buffer-major-mode ()
  (interactive)
  (describe-variable 'major-mode))

;; reformat your json file, it requires python
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -mjson.tool" (current-buffer) t)))
(defun remove-semicolon-eol ()
  "remove semicolons in javascript"
  (interactive)
  (goto-char (point-min))
  (while (search-forward ";" nil t) (replace-match "")))


(global-set-key (kbd "C-M-\\") 'format-buffer)
(provide 'init-utils)
;;; init-utils.el ends here
