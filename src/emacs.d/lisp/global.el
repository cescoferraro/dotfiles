(require 'powerline)
(require 'powerline-evil)
(require 'spaceline-config)
(provide 'init-global)
(require 'editorconfig)


;; global modes
(tool-bar-mode -1)
(projectile-mode t)
(linum-relative-global-mode t)
(editorconfig-mode 1)

;; set themes
(load-theme 'tsdh-dark)
(spaceline-spacemacs-theme)
(powerline-default-theme)







;; file extension syntax highlighting
(add-to-list 'auto-mode-alist '("\\.bash.local\\'" . shell-script-mode))
