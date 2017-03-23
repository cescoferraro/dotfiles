(require 'all-the-icons)
(require 'golden-ratio)
(require 'meghanada)
(require 'evil)
(require 'evil-magit)
(require 'evil-leader)
(require 'tide)
(require 'helm-projectile)
(require 'evil-surround)
(global-evil-surround-mode 1)

(golden-ratio-mode 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")


(evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)

;; global shortcuts
(evil-leader/set-key "e" 'find-file)
(evil-leader/set-key "f" 'helm-projectile)
(evil-leader/set-key "r" 'save-buffer)
(evil-leader/set-key "q" 'kill-emacs)
(evil-leader/set-key "G" 'magit-status)
(evil-leader/set-key "w" 'delete-window)
(evil-leader/set-key "b" 'helm-projectile-switch-to-buffer)
(evil-leader/set-key (kbd "/")
( lambda ()
    (interactive)
      (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

    )

;;global shortcuts functions
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






;; golang shorcuts
(evil-leader/set-key-for-mode 'go-mode
  "j" 'godef-jump-other-window
  "g" 'godef-jump
 )



;; java shotcuts
(evil-leader/set-key-for-mode 'java-mode "c"
  (lambda ()
    (interactive)
    (meghanada-run-task "run")
    (ace-window "")
    (golden-ratio)
    )
  )


(evil-leader/set-key-for-mode 'java-mode "t"
  (lambda ()
    (interactive)
    (meghanada-run-task "test")
    (ace-window "")
    (golden-ratio)
    )
  )


;; typescript shortcuts
(evil-leader/set-key-for-mode 'web-mode
  "j"  (lambda ()
    (interactive)
    (tide-jump-to-implementation )
    )
  "g"  (lambda ()
    (interactive)
    (tide-jump-to-definition )
    )
)




;; emacs variable
(evil-leader/set-key "M"
  (lambda ()
    (interactive)
    (message "%s" major-mode)
    )
  )





(evil-mode 1)

(provide 'init-evil)
