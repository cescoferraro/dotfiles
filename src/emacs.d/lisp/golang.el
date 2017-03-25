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

(provide 'init-golang)
