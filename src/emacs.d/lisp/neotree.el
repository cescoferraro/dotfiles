(require 'neotree)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(evil-leader/set-key
"m"  'neotree-toggle
"n"  'neotree-project-dir)

(setq projectile-switch-project-action 'neotree-projectile-action)

(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "1") 'neotree-change-root)
    (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
    (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
    (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
    (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
    (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
    (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

    (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
    (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
    )
  )

(provide 'init-neotree)
