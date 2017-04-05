;; MELPA - various modes (scala)
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

(use-package company ;;complete anything mode
  :ensure t
  :diminish company-mode
  :init (setq
	 company-dabbrev-downcase nil      ; preserve case in completions
	 company-idle-delay 0.1
	 company-minimum-prefix-length 1
	 company-tooltip-limit 20)
  :config (add-hook 'after-init-hook 'global-company-mode))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :init (setq magit-last-seen-setup-instructions "1.4.0")
  :config
  (use-package magit-gitflow
    :config (add-hook
	     'magit-mode-hook
	     'turn-on-magit-gitflow)))

(use-package helm
  :ensure t
  :demand
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("M-s o" . helm-occur))
  :config (progn
            (require 'helm-config)
            (setq helm-ff-file-name-history-use-recentf t)
            (helm-mode 1)
            (use-package wgrep-helm :ensure)
            (use-package helm-projectile
              :ensure
              :config (helm-projectile-on))
            (use-package helm-git-grep
              :ensure
              :bind ("M-s g" . helm-git-grep-at-point)
              :config
              ;; Disable result limit
              (setq helm-git-grep-candidate-number-limit nil)
              ;; Invoke `helm-git-grep' from isearch.
              (define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
              ;; Invoke `helm-git-grep' from other helm.
              (eval-after-load 'helm
                '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm)))))

(use-package helm-ls-git
	     :ensure t
	     :demand)

(use-package projectile ;; Project Interaction Library: e.g. C-c p f will search in the repo for filename
  :ensure t
  :config
  (defun my-format-projectile-modeline ()
    (propertize (format " |%s|" (projectile-project-name))
                'face '(:foreground "black" :background "#81a2be")))
  (defun my-conditional-projectile-modeline ()
    (if (condition-case nil (and projectile-require-project-root
                                 (projectile-project-root))
          (error nil))
        (my-format-projectile-modeline) ""))
  (setq projectile-mode-line '(:eval (my-conditional-projectile-modeline)))
  (projectile-global-mode))

(use-package which-key ;; autocompletion of key combinations
  :ensure
  :diminish which-key-mode
  :config (which-key-mode t))

(use-package tangotango-theme
  :ensure t
  :init (load-theme 'tango t))

(use-package ido ;; better switching of buffers and opening of files
  :ensure t
  :config
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode t)
  (use-package flx-ido  ; better matching
    :ensure t
    :config (flx-ido-mode 1)
    ;; disable ido faces to see flx highlights.
    (setq ido-use-faces nil)))

(use-package powerline
  :ensure t
  :init
  (powerline-default-theme)
  (setq powerline-display-mule-info nil)
  (setq powerline-display-hud nil)
  (setq powerline-display-buffer-size nil))

(use-package indent-guide
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package git-gutter
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package js2-mode
  :ensure t)

(use-package exec-path-from-shell
  :ensure t)

(use-package auto-complete
  :ensure t)

(use-package yaml-mode
             :ensure t)

(use-package midnight) ;; clean up stale buffers automatically

(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

(use-package ace-jump-mode
  :ensure
  :bind ("C-c SPC" . ace-jump-mode))

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

(add-to-list 'auto-mode-alist '("BUILD$" . python-mode))

;; JSON mode 2 space indentation
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
