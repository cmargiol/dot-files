;;; turn on syntax highlighting
(global-font-lock-mode 1)


;*******************************************************************************
; Colour themes
;*******************************************************************************
;(setq load-path (append (list nil "~/.emacs.d/color-themes/") load-path))
(add-to-list 'load-path "~/.emacs.d/color-themes/")
(add-to-list 'load-path "~/.emacs.d/color-themes/themes/")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(setq color-theme-is-cumulative t)
(setq color-theme-load-all-themes nil)
;(color-theme-zenburn)
(color-theme-tango)
(if (eq system-type 'darwin) ;; on the mac use a larger font (larger resolution)
    (set-face-attribute 'default nil
			:family "Source Code Pro"
			:height 125
			:weight 'normal
			:width 'normal)
  (set-default-font "SourceCodePro-9")
					;(set-default-font "Inconsolata-11")
					;(set-default-font "Consolas-10")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            GUI config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; speedbar in frame
;(require 'sr-speedbar)
; Disable the menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)
;; highlight current line
(global-hl-line-mode 1)
;; customise hl color
(set-face-background 'hl-line "gray28")  ;; Emacs 22 Only
