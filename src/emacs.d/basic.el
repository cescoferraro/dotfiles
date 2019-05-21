;; automatically add cask dependencies when M-x package-install
(require 'pallet)
(pallet-mode t)

;; load use-package
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)

(progn
 ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))

  ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
  (setq whitespace-display-mappings
        ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
        '(
          (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
          (newline-mark 10 [182 10]) ; LINE FEED,
          (tab-mark 9 [9655 9] [92 9]) ; tab
          )))

(defun cesco/switch-dictionary ()
  (interactive)
  (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "pt_BR") "english" "pt_BR")))
    (ispell-change-dictionary change)
    (message "Dictionary switched from %s to %s" dic change)
    ))

;; Originally from stevey, adapted to support moving to a new directory.
(defun cesco/rename-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (progn
     (if (not (buffer-file-name))
         (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     ;; Disable ido auto merge since it too frequently jumps back to the original
     ;; file name if you pause while typing. Reenable with C-z C-z in the prompt.
     (let ((ido-auto-merge-work-directories-length -1))
       (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
                                                       (buffer-file-name))))))))
  (if (equal new-name "")
      (error "Aborted rename"))
  (setq new-name (if (file-directory-p new-name)
                     (expand-file-name (file-name-nondirectory
                                        (buffer-file-name))
                                       new-name)
                   (expand-file-name new-name)))
  ;; Only rename if the file was saved before. Update the
  ;; buffer name and visited file in all cases.
  (if (file-exists-p (buffer-file-name))
      (rename-file (buffer-file-name) new-name 1))
  (let ((was-modified (buffer-modified-p)))
    ;; This also renames the buffer, and works with uniquify
    (set-visited-file-name new-name)
    (if was-modified
        (save-buffer)
      ;; Clear buffer-modified flag caused by set-visited-file-name
      (set-buffer-modified-p nil)))

  (setq default-directory (file-name-directory new-name))

  (message "Renamed to %s." new-name))

(global-auto-revert-mode 1)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun xah-toggle-letter-case ()
  "Toggle The letter case of current word or text selection.
Always cycle in this order: Init Caps, ALL CAPS, all lower.

URL `http://ergoemacs.org/emacs/modernization_upcase-word.html'
Version 2017-04-19"
  (interactive)
  (let (
        (deactivate-mark nil)
        -p1 -p2)
    (if (use-region-p)
        (setq -p1 (region-beginning)
              -p2 (region-end))
      (save-excursion
        (skip-chars-backward "[:alnum:]-_")
        (setq -p1 (point))
        (skip-chars-forward "[:alnum:]-_")
        (setq -p2 (point))))
    (when (not (eq last-command this-command))
      (put this-command 'state 0))
    (cond
     ((equal 0 (get this-command 'state))
      (upcase-initials-region -p1 -p2)
      (put this-command 'state 1))
     ((equal 1  (get this-command 'state))
      (upcase-region -p1 -p2)
      (put this-command 'state 2))
     ((equal 2 (get this-command 'state))
      (downcase-region -p1 -p2)
      (put this-command 'state 0)))))
(global-set-key (kbd "C-c t") 'xah-toggle-letter-case)

(use-package hideshow
  :diminish hs-minor-mode
  :config
  )

(defun cesco/automatic-push (msg)
  (interactive
   (list (read-from-minibuffer "Commit msg:" nil nil nil nil )))
  (message msg)
  (magit-run-git "commit" "--all" (concat "--message=" msg ))
    (let ((current-branch (magit-get-current-branch)))
    (magit-git-push current-branch
                    (concat "origin/" current-branch) nil )))

(defun cesco/insert-semicolon ()
  (interactive)
  (evil-append-line "1")
  (insert ";")
  (normal-mode)
(pop-global-mark)
  )

(setq user-full-name "Francesco Antonello Ferraro"
     user-mail-address "francescoaferraro@gmail.com "
     calendar-latitude 42.2
     calendar-longitude -71.1
     calendar-location-name "Cambridge, MA")

(defun cesco/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'control)
(setq mac-pass-command-to-system nil)
(setq mac-control-modifier 'super)

(delete-selection-mode +1)

(setq doc-view-continuous t)

(scroll-bar-mode -1)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(cond
 ((string-equal system-type "gnu/linux")
  (set-face-attribute 'default nil :height 145))
 ((string-equal system-type "darwin")
  (set-face-attribute 'default nil :height 155))
 )

(defun cesco/insert-empty-line ()
  (interactive)
  (newline))
(global-set-key [(shift return)] 'cesco/insert-empty-line)

(defun cesco/indent ()
  (interactive)
  (mark-whole-buffer)
  (indent-region (point-min) (point-max) nil)
  (pop-global-mark)
  )

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq ad-redefinition-action 'accept)

(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

(load-theme 'spacemacs-dark t)

(tool-bar-mode -1)

(delete-selection-mode 1)

(use-package simpleclip :ensure t
  :config

  (defun copy-to-x-clipboard ()
    (interactive)
    (let ((thing (if (region-active-p)
   		  (buffer-substring-no-properties (region-beginning) (region-end))
   		(thing-at-point 'symbol))))
   (simpleclip-set-contents thing)
   (message "thing => clipboard!")))

  (defun paste-from-x-clipboard()
    "Paste string clipboard"
    (interactive)
    (insert (simpleclip-get-contents)))

  ;; Press `Alt-Y' to paste from clibpoard when in minibuffer
  (defun my/paste-in-minibuffer ()
    (local-set-key (kbd "M-y") 'paste-from-x-clipboard))
  (add-hook 'minibuffer-setup-hook 'my/paste-in-minibuffer)
  )

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(defalias 'yes-or-no-p 'y-or-n-p)

(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((ignore-errors (org-edit-src-code))
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(eval-after-load 'org-src
  '(define-key org-src-mode-map
     "\C-x\C-s" #'org-edit-src-exit))

(setq split-width-threshold 1 )

;; NO spell check for embedded snippets
(defadvice org-mode-flyspell-verify (after org-mode-flyspell-verify-hack activate)
  (let ((rlt ad-return-value)
	(begin-regexp "^[ \t]*#\\+begin_\\(src\\|html\\|latex\\)")
	(end-regexp "^[ \t]*#\\+end_\\(src\\|html\\|latex\\)")
	old-flag
	b e)
    (when ad-return-value
      (save-excursion
	(setq old-flag case-fold-search)
	(setq case-fold-search t)
	(setq b (re-search-backward begin-regexp nil t))
	(if b (setq e (re-search-forward end-regexp nil t)))
	(setq case-fold-search old-flag))
      (if (and b e (< (point) e)) (setq rlt nil)))
    (setq ad-return-value rlt)))


(defun my/flyspell-hack ()
  (flyspell-mode 1)
  (flyspell-mode -1))

(use-package org
  :after (flyspell)
  :defer t
  :config
  (require 'ox-latex)
  (require 'htmlize)
  (require 'org-bullets)
  (require 'ox-reveal)
  (eval-after-load "org"
  '(require 'ox-md nil t))
  (eval-after-load "org"
  '(require 'ox-pandoc nil t))
  (setq ispell-dictionary "pt_BR")
  (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
  (diminish 'visual-line-mode)
  (setq org-reveal-mathjax t)
  (setq org-support-shift-select t)
  (setq org-cycle-separator-lines -2)

  (setq org-src-fontify-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (go . t)
     (java . t)
     (lisp . t)))

  (add-hook 'org-mode-hook 'my/flyspell-hack)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode t)))
  (add-hook 'org-mode-hook #'visual-line-mode)

  (global-set-key "\C-ca" 'org-agenda)

  (setq org-agenda-custom-commands
	'(("c" "Simple agenda view"
	   ((agenda "")
            (alltodo "")))))



  (defun air-org-skip-subtree-if-priority (priority)
    "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
	  (pri-value (* 1000 (- org-lowest-priority priority)))
	  (pri-current (org-get-priority (thing-at-point 'line t))))
      (if (= pri-value pri-current)
	  subtree-end
	nil)))



  (defun air-org-skip-if-habit (&optional subtree)
    "Skip an agenda entry if it has a STYLE property equal to \"habit\".
Skip the current entry unless SUBTREE is not nil, in which case skip
the entire subtree."
    (let ((end (if subtree (save-excursion (org-end-of-subtree t))
		 (save-excursion (progn (outline-next-heading) (1- (point)))))))
      (if (string= (org-entry-get nil "STYLE") "habit")
	  end
	nil)))



  (setq org-agenda-custom-commands
	'(("d" "Daily agenda and all TODOs"
	   ((tags "PRIORITY=\"A\""
		  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
		   (org-agenda-overriding-header "High-priority unfinished tasks:")))
	    (agenda "" ((org-agenda-ndays 1)))
	    (alltodo ""))
	   ((org-agenda-compact-blocks t)))))

  (use-package org-ac
    :ensure t
    :init (progn
	    (require 'org-ac)
	    (org-ac/config-default)
	    ))

  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-agenda-files (list "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/agenda.org"
			       "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/i.org"
			       ))
  (setq org-capture-templates
	'(("a" "Appointment" entry (file  "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/agenda.org" )
	   "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
	  ("l" "Link" entry (file+headline "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/links.org" "Links")
	   "* %? %^L %^g \n%T" :prepend t)
	  ("b" "Blog idea" entry (file+headline "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/i.org" "Blog Topics:")
	   "* %?\n%T" :prepend t)
	  ("t" "To Do Item" entry (file+headline "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/i.org" "To Do")
	   "* TODO %?\n%u" :prepend t)
	  ("m" "Mail To Do" entry (file+headline "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/i.org" "To Do")
	   "* TODO %a\n %?" :prepend t)
	  ("g" "GMail To Do" entry (file+headline "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/i.org" "To Do")
	   "* TODO %^L\n %?" :prepend t)
	  ("n" "Note" entry (file+headline "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/i.org" "Note space")
	   "* %?\n%u" :prepend t)
	  ))

  (use-package org-gcal
    :after org
    :config
    (setq org-gcal-client-id "676848901171-cr0oc676mq0cvcrkr53gs1j73eu21rqu.apps.googleusercontent.com"
	  org-gcal-client-secret "o6lGcXJkdTaFb6_gs_vwI4IV"
	  org-gcal-file-alist '(("francescoaferraro@gmail.com" .  "~/go/src/github.com/cescoferraro/dotfiles/src/agenda/agenda.org")))
    (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
    (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) )))

  )
