
;;; Commentary:
;;; lisp configuration

;;; Code:

(require 'flycheck)
(flycheck-mode)
(set-face-attribute 'flycheck-error nil :foreground "pink")
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))


(provide 'init-flycheck)
