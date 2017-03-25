;;; package -- Java Init Package
;;; Commentary:
;;; Using meghanada
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
(provide 'init-java)
;;; java.el ends here
