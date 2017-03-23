(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)


(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/*.el"))


(require 'init-global)
(require 'init-neotree)
(require 'init-java)
(require 'init-golang)
(require 'init-typescript)


(setq split-height-threshold nil)
(setq split-width-threshold 0)

(require 'init-helm)

(require 'init-evil)
(set-face-attribute 'comint-highlight-prompt nil
                        :inherit nil)
