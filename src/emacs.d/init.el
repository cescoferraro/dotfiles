(require 'cask "~/.cask/cask.el") (cask-initialize)
(require 'pallet)
(pallet-mode t)


(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/*.el"))
(require 'init-global)
(require 'init-evil)
(require 'init-neotree)
(require 'init-java)
(require 'init-golang)
(require 'init-typescript)


(setq split-height-threshold nil)
(setq split-width-threshold 0)
