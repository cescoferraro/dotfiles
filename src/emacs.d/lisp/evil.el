

(require 'golden-ratio)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'find-file)

(evil-leader/set-key 
 (kbd ".")
 (lambda ()
   (interactive)
      (ace-window "")))


(evil-leader/set-key "s" 'save-buffer)
(evil-leader/set-key "q" 'delete-window)
(require 'meghanada)
(evil-leader/set-key-for-mode 'go-mode
  "j" 'godef-jump-other-window
  "J" 'godef-jump
 )
(require 'tide)
(evil-leader/set-key-for-mode 'tide
  "j" 'ace-window
  "J" 'ace-window
 )


(golden-ratio-mode 1)
(evil-leader/set-key-for-mode 'java-mode "r"
  (lambda ()
    (interactive)
    (meghanada-run-task "run")
    (ace-window "")
    (golden-ratio)
    )
  )


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

(golden-ratio-mode 1)
(evil-leader/set-key "m"
  (lambda ()
    (interactive)
    (message "%s" major-mode)
    )
  )


(golden-ratio-mode 1)


(evil-leader/set-key "f" 'golden-ratio)






(evil-leader/set-key 
 (kbd "b")
 (lambda ()
   (interactive)
      (find-file "~/.bash.local")))


(evil-leader/set-key 
 (kbd "i")
 (lambda ()
   (interactive)
      (find-file "~/.emacs.d/init.el")))


(require 'evil)
(evil-mode 1)



(require 'all-the-icons)


(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
(add-hook 'dired-mode-hook 'dired-icon-mode)




(provide 'init-evil)
