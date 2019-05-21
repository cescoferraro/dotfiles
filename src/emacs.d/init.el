
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
;; Configuration
(org-babel-load-file "~/.emacs.d/basic.org")
(org-babel-load-file "~/.emacs.d/configuration.org")
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
