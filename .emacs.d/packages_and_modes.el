; MELPA - various modes (groovy, scala)
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Add libs folder to the 'load-path
(add-to-list 'load-path "~/.emacs.d/libs/")

;; Install missing packages
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(python-environment
   jedi
   indent-guide
   flycheck
   git-gutter
   helm-ls-git
   json-mode
   js2-mode
   go-mode
   groovy-mode
   exec-path-from-shell
   auto-complete
   go-autocomplete
   helm-git-grep)
)

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
