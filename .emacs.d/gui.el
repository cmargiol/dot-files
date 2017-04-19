;;; turn on syntax highlighting
(global-font-lock-mode 1)


;*******************************************************************************
; Colour themes
;*******************************************************************************
;; (use-package tangotango-theme
;;   :ensure t
;;   :init (load-theme 'tango t))

;; Alex's theme
;; (use-package zenburn-theme
;;   :ensure t
;;   :init (load-theme 'zenburn t)
;;   :config
;;   (zenburn-with-color-variables
;;     (custom-theme-set-faces
;;      'zenburn
;;      `(mode-line
;;        ((,class (:foreground "black" :background "#f9b593" :box nil))
;;         (t :inverse-video t)))
;;      `(mode-line-inactive
;;        ((t (:foreground ,zenburn-green-1 :background ,zenburn-bg-05 :box nil))))
;;      `(mode-line-buffer-id ((t (:foreground "black" :weight bold))))
;;      `(powerline-active1
;;        ((t (:foreground ,zenburn-green-1 :background ,zenburn-bg-05
;;                         :inherit mode-line))))
;;      `(powerline-active2 ((t (:background ,zenburn-bg+2 :inherit mode-line)))))))

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

(if (eq system-type 'darwin) ;; on the mac use a larger font (larger resolution)
    (set-face-attribute 'default nil
			:family "Hack"
			:height 110
			:weight 'normal
			:width 'normal)
  (set-default-font "SourceCodePro-9")
  ;(set-default-font "Inconsolata-10.5")
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
