;; Load GOPATH from shell - OSX related
(exec-path-from-shell-copy-env "GOPATH")

;; GODEF to jump to definition in gomode
(defun my-go-mode-hook ()
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; Godef jump key binding
  (local-set-key (kbd "C-.") 'godef-jump)
  (local-set-key (kbd "C-i C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-i C-a") 'go-import-add)

  )

(add-hook 'go-mode-hook 'my-go-mode-hook)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)