;*******************************************************************************
; Misc
;*******************************************************************************

;*******************************************************************************
; nxml pretty print
;*******************************************************************************
(defun nxml-pretty-print-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this. The function inserts linebreaks to separate tags that have
nothing but whitespace between them. It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))
(global-set-key [f6] 'nxml-pretty-print-region)

;*******************************************************************************
; json pretty print
;*******************************************************************************
(defun pretty-print-json(&optional b e)
  "Shells out to Python to pretty print JSON"
  (interactive "r")
  (shell-command-on-region b e "python -m json.tool" (current-buffer) t)
)

;; Turn on column number mode
(column-number-mode t)
;; add line/column numbers
(global-linum-mode t)
; Scroll step one line
(setq scroll-step 1)
(show-paren-mode 1)
; Visual bell instead of annoying beep
(setq visible-bell t)

; Add new line *and* indent on hitting enter
(define-key global-map (kbd "RET") 'newline-and-indent)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-strip-common-suffix t)

; Delete training whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Do not display welcome screen on start
(setq inhibit-startup-message t)

;; indent guide
(indent-guide-global-mode)

;; add git info to the gutter
(global-git-gutter-mode +1)

;; Save all auto-saves and backups in the directory pointed to by
;; temporary-file-directory (the system’s “temp” directory)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
