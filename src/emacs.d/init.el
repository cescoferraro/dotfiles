
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Configuration
(org-babel-load-file "~/.emacs.d/configuration.org")
