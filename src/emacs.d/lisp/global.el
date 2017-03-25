(require 'projectile)

(require 'editorconfig)


;; set themes
(load-theme 'tsdh-dark)
(tool-bar-mode -1)

;; global modes
(editorconfig-mode 1)
(projectile-mode t)




(setq backup-by-copying t
    backup-directory-alist '(("." . "~/.emacs.d/backups"))
    delete-old-versions t
    kept-new-versions 5
    kept-old-versions 2
          version-control t)

;; file extension syntax highlighting
(add-to-list 'auto-mode-alist '("\\.bash.local\\'" . shell-script-mode))



(provide 'init-global)
