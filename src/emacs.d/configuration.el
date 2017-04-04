(setq user-full-name "Francesco Antonello Ferraro"
      user-mail-address "francescoaferraro@gmail.com "
      calendar-latitude 42.2
      calendar-longitude -71.1
      calendar-location-name "Cambridge, MA")

(load-theme 'tsdh-dark)

(tool-bar-mode -1)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package projectile
	  :config
	  (projectile-global-mode))

(use-package linum-relative
  :diminish linum-relative-mode
  :ensure t
  :config
  (progn (linum-mode)
         (linum-relative-global-mode)
         (setq linum-relative-current-symbol "")
         )
)

(use-package spaceline
    :config
    (require 'spaceline-config)
    (spaceline-spacemacs-theme)
    (spaceline-toggle-buffer-size-off)
    (spaceline-toggle-version-control-on)
    (spaceline-toggle-selection-info-on)
    (spaceline-toggle-buffer-encoding-on)
    (spaceline-toggle-minor-modes-on)
    (spaceline-toggle-minor-modes-on))

(use-package flycheck
  :init
  ;(add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq flycheck-display-errors-delay 0.3)
  (set-face-attribute 'flycheck-error nil :background "#8c5353")
  (set-face-attribute 'flycheck-warning nil :background "#535399")
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
)

(use-package magit
  :ensure magit
  :ensure evil-magit
  :after evil
  :init
  (evil-magit-init)
  (evil-leader/set-key "g" 'magit-status))

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)
(require 'godoctor)
;; golang shorcuts
(require 'evil-leader)
(evil-leader/set-key-for-mode 'go-mode
  "j" 'godef-jump-other-window
  "g" 'godef-jump
 )





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

(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(with-eval-after-load 'go-mode
  (lambda ()
   (require 'go-autocomplete))
)



(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'go-mode-hook 'my-go-mode-hook)

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

(require 'evil-leader)

;; typescript shortcuts
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

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
    (lambda ()
        (when (string-equal "jsx" (file-name-extension buffer-file-name))
                          (setup-tide-mode))))

(use-package evil
  :ensure t
  :config
  (use-package evil-org :ensure t)
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-leader ",")
    (evil-leader/set-key
    "m"  'neotree-toggle
    "n"  'neotree-project-dir
     "v" 'evil-visual-block
     "z" 'zoom-window-zoom
     "f" 'helm-projectile
     "s" 'save-buffer
     "q" 'kill-emacs
     "G" 'magit-status
     "w" 'delete-window
     "e" 'kill-this-buffer
     "E" 'org-export-dispatch
     "," 'helm-projectile-switch-to-buffer
     "'"  (lambda () (interactive) (ansi-term (getenv "SHELL")))
     (kbd ".") (lambda () (interactive (ace-window "")))
     (kbd "o") (lambda () (interactive) (find-file "~/.bash.local"))
     (kbd "i") (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
     (kbd "/") ( lambda () (interactive)
          (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
    )

    (evil-define-key 'visual evil-surround-mode-map "A" 'evil-substitute)
    (evil-define-key 'visual evil-surround-mode-map "a" 'evil-surround-region)
    (evil-define-key 'visual evil-surround-mode-map "E" 'org-export-dispatch)
    (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)
    )

(use-package neotree
  :init
(add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
    (define-key evil-normal-state-local-map (kbd "1") 'neotree-change-root)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
))
)

  :config
  (global-evil-leader-mode)
  (evil-mode)

  ; Search by symbols rather than words by default
  (set-default 'evil-symbol-word-search t)
  )



(use-package counsel :ensure t)
(use-package swiper
    :ensure t
    :config
    (progn
        (ivy-mode 1)
        (setq ivy-use-virtual-buffers t)
        (setq enable-recursive-minibuffers t)
        (global-set-key "\C-s" 'swiper)
        (global-set-key (kbd "C-c C-r") 'ivy-resume)
        (global-set-key (kbd "<f6>") 'ivy-resume)
        (global-set-key (kbd "M-x") 'counsel-M-x)
        (global-set-key (kbd "C-x C-f") 'counsel-find-file)
        (global-set-key (kbd "<f1> f") 'counsel-describe-function)
        (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
        (global-set-key (kbd "<f1> l") 'counsel-find-library)
        (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
        (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
        (global-set-key (kbd "C-c g") 'counsel-git)
        (global-set-key (kbd "C-c j") 'counsel-git-grep)
        (global-set-key (kbd "C-c k") 'counsel-ag)
        (global-set-key (kbd "C-x l") 'counsel-locate)
        (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
        (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    )
)
