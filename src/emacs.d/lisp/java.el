
(add-hook 'java-mode-hook
	  (lambda ()
	    ;; meghanada-mode on
	    (meghanada-mode t)
	    (meghanada-client-direct-connect t)
	    (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
(provide 'init-java)
