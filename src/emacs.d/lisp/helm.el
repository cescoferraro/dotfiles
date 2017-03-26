(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)

(define-key helm-map (kbd "C-;") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") 'helm-execute-persistent-action)

(provide 'init-helm)
