(require 'helm)
(use-package helm
    :ensure t
    :config
    (helm-mode 1)
    (setq helm-autoresize-mode t)
    ;; (global-set-key (kbd "M-x") #'helm-M-x)
    (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action)
    (define-key helm-map (kbd "C-2") 'helm-toggle-visible-mark)
    )
(provide 'init-helm)
