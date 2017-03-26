(require 'cask "~/.cask/cask.el")

(cask-initialize)
(require 'pallet)

(pallet-mode t)


(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/global.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/linum.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/helm.el"))

(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/spaceline.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/flycheck.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/neotree.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/evil.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/golang.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/typescript.el"))
(mapc 'load (file-expand-wildcards "~/.emacs.d/lisp/java.el"))


(require 'init-global)
(require 'init-linum)
(require 'init-spaceline)
(require 'init-evil)
(require 'init-neotree)
(require 'init-flycheck)
(require 'init-golang)
(require 'init-typescript)
(require 'init-java)
(require 'init-helm)
