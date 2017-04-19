;; Python related settings

(use-package python-environment
  :ensure t)

(use-package jedi-core
  :config
  (setq jedi:use-shortcuts t) ; M-. and M-,
  (add-hook 'python-mode-hook 'jedi:setup)
  (use-package company-jedi
    :ensure
    :config
    (add-hook 'python-mode-hook
              (lambda () (add-to-list 'company-backends
                                      'company-jedi)))))

(add-hook 'python-mode-hook 'subword-mode)

(use-package py-autopep8
  :ensure
  :config
  (setq py-autopep8-options '("--max-line-length=99"))
  (defun python-mode-keys ()
    "Modify python-mode local key map"
    (local-set-key (kbd "C-c C-p") 'py-autopep8-buffer))
  (add-hook 'python-mode-hook 'python-mode-keys))

(defvar jedi:goto-stack '())
(defun jedi:jump-to-definition ()
  (interactive)
  (add-to-list 'jedi:goto-stack
               (list (buffer-name) (point)))
  (jedi:goto-definition))
(defun jedi:jump-back ()
  (interactive)
  (let ((p (pop jedi:goto-stack)))
    (if p (progn
            (switch-to-buffer (nth 0 p))
            (goto-char (nth 1 p))))))

;; jedi hook - http://tkf.github.io/emacs-jedi/latest/
(setq jedi:complete-on-dot t)                 ; optional
;;(jedi:install-server)


(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'jedi:jump-to-definition)
             (local-set-key (kbd "C-,") 'jedi:jump-back)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)
             (local-set-key (kbd "C-<tab>") 'jedi:complete)))
