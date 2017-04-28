(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(eval-when-compile (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)



(use-package org :ensure t)

(use-package org-bullets
    :ensure t
    :config

    (setq org-src-fontify-natively t)
    (setq org-confirm-babel-evaluate nil)
    (org-babel-do-load-languages
        'org-babel-load-languages
        '((emacs-lisp . t)
             (python . t)
             (go . t)
             (java . t)
             (lisp . t)))


    (add-hook 'org-mode-hook (lambda () (org-bullets-mode t))))


(org-babel-load-file "~/.emacs.d/configuration.org")

   #+BEGIN_SRC emacs-lisp

     (require 'meghanada)
     (require 'flycheck)
     (require 'evil-leader)

     ;;; Code:

     (evil-leader/set-key-for-mode 'java-mode "t"
       (lambda ()
         (interactive)
         (meghanada-run-task "test")
         (ace-window "")
         (golden-ratio)
         )
       )
     (evil-leader/set-key-for-mode 'java-mode "c"
       (lambda ()
         (interactive)
         (meghanada-run-task "run")
         (ace-window "")
         (golden-ratio)
         )
       )


     (add-hook 'java-mode-hook
   	    (lambda ()
   	      ;; meghanada-mode on
   	      (meghanada-mode t)
   	      (add-hook 'before-save-hook (lambda ()
   					    (flycheck-display-error-at-point)
   					    (meghanada-code-beautify-before-save)
   					    ))))


   #+END_SRC
