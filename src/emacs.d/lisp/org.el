(require 'ob-go)
(setq debug-on-error t)

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (go . t)
   (java . t)
   (lisp . t)))


(provide 'init-org)
