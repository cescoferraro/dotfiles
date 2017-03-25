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

(provide 'init-typescript)
