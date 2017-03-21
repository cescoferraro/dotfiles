(require 'cask "~/.cask/cask.el") (cask-initialize)
(require 'pallet)
(pallet-mode t)

(tool-bar-mode -1)
(load-theme 'tsdh-dark)
;; Stop on the first error.
(setq compilation-scroll-output 'next-error)
;; Don't stop on info or warnings.
(setq compilation-skip-threshold 0)
(add-to-list 'auto-mode-alist '("\\.bash.local\\'" . shell-script-mode))
(linum-relative-global-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'golden-ratio)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "e" 'find-file)

(evil-leader/set-key 
 (kbd ".")
 (lambda ()
   (interactive)
      (ace-window "")))


(evil-leader/set-key "s" 'save-buffer)
(evil-leader/set-key "q" 'delete-window)
(require 'meghanada)
(evil-leader/set-key-for-mode 'go-mode
  "j" 'godef-jump-other-window
  "J" 'godef-jump
 )
(require 'tide)
(evil-leader/set-key-for-mode 'tide
  "j" 'ace-window
  "J" 'ace-window
 )


(golden-ratio-mode 1)
(evil-leader/set-key-for-mode 'java-mode "r"
  (lambda ()
    (interactive)
    (meghanada-run-task "run")
    (ace-window "")
    (golden-ratio)
    )
  )


(evil-leader/set-key-for-mode 'web-mode
  "j"  (lambda ()
    (interactive)
    (tide-jump-to-implementation )
    )
  "g"  (lambda ()
    (interactive)
    (tide-jump-to-definition )
    )
)

(golden-ratio-mode 1)
(evil-leader/set-key "m"
  (lambda ()
    (interactive)
    (message "%s" major-mode)
    )
  )


(golden-ratio-mode 1)


(evil-leader/set-key "f" 'golden-ratio)






(evil-leader/set-key 
 (kbd "b")
 (lambda ()
   (interactive)
      (find-file "~/.bash.local")))


(evil-leader/set-key 
 (kbd "i")
 (lambda ()
   (interactive)
      (find-file "~/.emacs.d/init.el")))


(require 'evil)
(evil-mode 1)




(require 'powerline)
(powerline-default-theme)
(require 'powerline-evil)


(require 'all-the-icons)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-hook 'neotree-mode-hook
	  (lambda ()
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter-vertical-split)
	    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter-horizontal-split)
	    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
	            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("756ec68798410a2e705dd719c7328af9ecbb782c94130d489b6b3109841833eb" "f5ad3af69f2b6b7c547208b8708d4fa7928b5697ca0845633d1d67c2d145952a" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" default)))
 '(split-height-threshold nil)
 '(split-width-threshold 160))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'spaceline-config)
(spaceline-spacemacs-theme)


(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))



(add-hook 'dired-mode-hook 'dired-icon-mode)



(add-hook 'java-mode-hook
	  (lambda ()
	    ;; meghanada-mode on
	    (meghanada-mode t)
	    (meghanada-client-direct-connect t)
	    (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))


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
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet")) 
  (load-file "$GOPATH/src/github.com/dominikh/go-mode.el/go-guru.el")
 )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
(add-hook 'go-mode-hook 'go-eldoc-setup)





(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (when (string-equal "tsx" (file-name-extension buffer-file-name))
	                    (setup-tide-mode))))





(setq split-height-threshold nil)
(setq split-width-threshold -100)
