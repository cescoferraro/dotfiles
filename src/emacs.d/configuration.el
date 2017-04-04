(setq user-full-name "Francesco Antonello Ferraro"
      user-mail-address "francescoaferraro@gmail.com "
      calendar-latitude 42.2
      calendar-longitude -71.1
      calendar-location-name "Cambridge, MA")

(load-theme 'tsdh-dark)

(tool-bar-mode -1)

(use-package editorconfig 
  :config
  (editorconfig-mode 1))

(use-package projectile
	  :config
	  (projectile-global-mode))

(use-package linum-relative
  :diminish linum-relative-mode
  :ensure t
  :config
  (progn (linum-mode)
         (linum-relative-global-mode)
         (setq linum-relative-current-symbol "")
         )
)

(use-package spaceline
    :config
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (spaceline-toggle-buffer-size-off)
    (spaceline-toggle-version-control-on)
    (spaceline-toggle-selection-info-on)
    (spaceline-toggle-buffer-encoding-on)
    (spaceline-toggle-minor-modes-on)
    (spaceline-toggle-minor-modes-on))

(use-package evil
  :ensure t
  :config
  (use-package evil-org :ensure t)
  (use-package neotree :ensure t)
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-leader ",")
    (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir)
    
    (evil-leader/set-key "v" 'evil-visual-block)
    (evil-define-key 'visual evil-surround-mode-map "A" 'evil-substitute)
    (evil-define-key 'visual evil-surround-mode-map "a" 'evil-surround-region)
    (evil-define-key 'visual evil-surround-mode-map "E" 'org-export-dispatch)
    
    ;; global shortcuts
    (evil-leader/set-key "z" 'zoom-window-zoom)
    (evil-leader/set-key "f" 'helm-projectile)
    (evil-leader/set-key "s" 'save-buffer)
    
    (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)
    (evil-leader/set-key "q" 'kill-emacs)
    (evil-leader/set-key "G" 'magit-status)
    (evil-leader/set-key "w" 'delete-window)
    (evil-leader/set-key "e" 'kill-this-buffer)
    (evil-leader/set-key "E" 'org-export-dispatch)
    (evil-leader/set-key "," 'helm-projectile-switch-to-buffer)
    (evil-leader/set-key (kbd "/")
    ( lambda ()
        (interactive)
          (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
    
        )
    
    ;;global shortcuts functions
    (evil-leader/set-key "'"  (lambda () (interactive) (ansi-term (getenv "SHELL")))  )
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
    
    
    )
  :config
  (global-evil-leader-mode)
  (evil-mode)

  ; Search by symbols rather than words by default
  (set-default 'evil-symbol-word-search t)
  )

(use-package neotree
  :ensure t
  :config

    (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir)

  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))
