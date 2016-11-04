;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      Key mappings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; osx key mappings							  ;;
;; Check out http://www.emacswiki.org/emacs/EmacsForMacOS#toc22 for more  ;;
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

;Refresh file by pressing F5
(global-set-key [f5] (lambda() (interactive) (revert-buffer t t t)))

;; Load .emacs file on f7
(global-set-key [f7] (lambda() (interactive) (load-file "~/.emacs")))

; Awesome moving between windows
(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-g" 'goto-line)

;; git repo search
(global-set-key (kbd "C-c C-g") 'helm-git-grep)

;; Add new line *and* indent on hitting enter
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Emulation of the vi % command
(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'goto-match-paren)

;;(global-set-key (kbd "<home>") 'beginning-of-line)

;; Go to last change
(require 'goto-last-change)
(global-set-key [(control shift backspace)] 'goto-last-change)

;; C-d to duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-u") 'duplicate-line)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; Neotree shortcut
(global-set-key [f8] 'neotree-toggle)
