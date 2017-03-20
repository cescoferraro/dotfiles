(tool-bar-mode -1)

(set-background-color "black")
(set-foreground-color "wheat")
(require 'cask "~/.cask/cask.el") (cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'evil-leader)

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'find-file)



(require 'evil)
(evil-mode 1)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(linum-relative-global-mode t)
(require 'powerline)
(powerline-default-theme)
(require 'powerline-evil)


(require 'all-the-icons)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter-vertical-split)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter-horizontal-split)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" default))))
(custom-set-faces)


(require 'spaceline-config)
(spaceline-spacemacs-theme)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))



(add-hook 'dired-mode-hook 'dired-icon-mode)


(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/home/cescoferraro/go")

(add-to-list 'exec-path "/home/cescoferraro/go/bin")


(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")) 
 )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
