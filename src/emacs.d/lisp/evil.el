(require 'golden-ratio)
(require 'zoom-window)
(require 'evil)
(require 'evil-magit)
(require 'evil-leader)
(require 'helm-projectile)
(require 'evil-surround)
(global-evil-surround-mode 1)




(golden-ratio-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")

;;(evil-leader/set-key "z" 'zoom-window-zoom)
(evil-leader/set-key "v" 'evil-visual-block)
(evil-define-key 'visual evil-surround-mode-map "A" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "a" 'evil-surround-region)

;; global shortcuts
(evil-leader/set-key "z" 'zoom-window-zoom)
(evil-leader/set-key "f" 'helm-projectile)
(evil-leader/set-key "s" 'save-buffer)

(evil-leader/set-key "q" 'kill-emacs)
(evil-leader/set-key "G" 'magit-status)
(evil-leader/set-key "w" 'delete-window)
(evil-leader/set-key "e" 'kill-buffer)
(evil-leader/set-key "b" 'helm-projectile-switch-to-buffer)
(evil-leader/set-key (kbd "/")
( lambda ()
    (interactive)
      (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

    )

;;global shortcuts functions
(evil-leader/set-key ","  (lambda () (interactive) (ansi-term (getenv "SHELL")))  )
(evil-leader/set-key
 (kbd ".")
 (lambda ()
   (interactive)
      (ace-window "")))



;; quick jump to files!
(evil-leader/set-key
 (kbd "o")
 (lambda ()
   (interactive)
      (find-file "~/.bash.local")))


(evil-leader/set-key
 (kbd "i")
 (lambda ()
   (interactive)
      (find-file "~/.emacs.d/init.el")))




;; emacs variable
(evil-leader/set-key "M"
  (lambda ()
    (interactive)
    (message "%s" major-mode)
    )
  )





(evil-mode 1)

(provide 'init-evil)
