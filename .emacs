;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/packages_and_modes.el")
(load "~/.emacs.d/keyboard.el")
(load "~/.emacs.d/gui.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/misc.el")
(load "~/.emacs.d/go.el")

;; Code checking
'(flycheck-jshintrc "~/dev/core/.jshintrc")
;; the following line doesn't seem to actually work. Apparently epylint used by flycheck cannot be
;; passed a pylint file as arg: https://github.com/flycheck/flycheck/issues/106 . Just run this
;; ln -s ~/dev/core/config/pylint.rcfile .pylintrc
'(flycheck-pylintrc "~/dev/core/config/pylint.rcfile")
'(global-flycheck-mode t nil (flycheck))
;; flycheck mode (syntax validation, linter, etc.)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Load PATH from environment
(exec-path-from-shell-initialize)

; highlight lines over 100 long
(require 'whitespace)
(setq whitespace-line-column 100) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; ---------------------- Automatically added by custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit yaml-mode use-package python-environment py-autopep8 powerline neotree multiple-cursors markdown-mode json-mode js2-mode indent-guide groovy-mode go-mode go-autocomplete git-gutter flycheck flx-ido exec-path-from-shell company all-the-icons ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
