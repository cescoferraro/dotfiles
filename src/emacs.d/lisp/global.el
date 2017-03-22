
(tool-bar-mode -1)
(load-theme 'tsdh-dark)
(add-to-list 'auto-mode-alist '("\\.bash.local\\'" . shell-script-mode))
(linum-relative-global-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)



(require 'powerline)
(powerline-default-theme)
(require 'powerline-evil)



(require 'spaceline-config)
(spaceline-spacemacs-theme)

(provide 'init-global)
