;; MELPA - various modes (groovy, scala)
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Add libs folder to the 'load-path
(add-to-list 'load-path "~/.emacs.d/libs/")

;; install and load use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Use use-package to load all the other packages
(use-package python-environment
  :ensure t)
(use-package jedi
  :ensure t)
(use-package indent-guide
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package git-gutter
  :ensure t)
(use-package helm-git-grep
  :ensure t)
(use-package helm-ls-git
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package js2-mode
  :ensure t)
(use-package go-mode
  :ensure t)
(use-package groovy-mode
  :ensure t)
(use-package exec-path-from-shell
  :ensure t)
(use-package auto-complete
  :ensure t)
(use-package go-autocomplete
  :ensure t)
(use-package yaml-mode
             :ensure t)
(use-package midnight) ;; clean up stale buffers automatically
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
(use-package multiple-cursors
  :ensure t)
(use-package all-the-icons
  :ensure t)
(use-package neotree
  :ensure t)

;; groovy mode
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'auto-mode-alist '("BUCK$" . python-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;; JSON mode 2 space indentation
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
