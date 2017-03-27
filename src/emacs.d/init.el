
;; Initialization of Internet dependencies
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
;; Initialization of local dependencies
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/*.el"))

;; Global Configs
(require 'init-global)
(require 'init-linum)
;; Status Line
(require 'init-spaceline)
;; Vim Layer
(require 'init-evil)
;; Folder side bar
(require 'init-neotree)
;; Linting
(require 'init-flycheck)
;; Language Definitions
(require 'init-golang)
(require 'init-typescript)
(require 'init-java)
;; Menu
(require 'init-helm)
