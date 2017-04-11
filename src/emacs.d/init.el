;; Setup package-manager
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; load use-package
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)


;; Custom configuration
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Configuration
(org-babel-load-file "~/.emacs.d/configuration.org")
