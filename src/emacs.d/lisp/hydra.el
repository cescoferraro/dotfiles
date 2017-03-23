(require 'hydra-examples)
(defhydra hydra-window (global-map "<f5>")
    "hydra window control"
    ("-" text-scale-decrease)
    ("=" text-scale-increase)
    ("h" hydra-move-splitter-left)
    ("j" hydra-move-splitter-down)
    ("k" hydra-move-splitter-up)
    ("l" hydra-move-splitter-right))
(defhydra helm-like-unite ()
      "
  ^^^ Nav ^^^    Action^^         Other
--^^^-----^^^----------^^---------^^^^-----------------
  ^ ^ _k_ ^ ^    _e_dit           _/_search
  _h_ ^ ^ _l_    _d_elete buffer  _?_help
  ^ ^ _j_ ^ ^    _v_iew           _t_,_T_: Scroll other
  ^ ^ ^ ^ ^ ^    _f_ollow         _i_: Cancel
  ^ ^ ^ ^ ^ ^    mark_a_ll
"
    ("?" helm-help nil)
    ("<escape>" keyboard-escape-quit nil)
    ("<SPC>" helm-toggle-visible-mark "mark")
    ("a" helm-toggle-all-marks nil)
    ("e" helm-swoop-edit nil)
    ;; not sure if there's a better way to do this
    ("/" (lambda ()
             (interactive)
             (execute-kbd-macro [?\C-s]))
        nil)
    ("v" helm-execute-persistent-action nil)
    ("d" helm-buffer-run-kill-persistent nil)
    ("g" helm-beginning-of-buffer nil)
    ("G" helm-end-of-buffer nil)
    ("j" helm-next-line nil)
    ("f" helm-follow-mode nil)
    ("k" helm-previous-line nil)
    ("t" helm-scroll-other-window nil)
    ("T" helm-scroll-other-window-down nil)
    ("C-d" (helm-next-line 10) nil)
    ("C-u" (helm-previous-line 10) nil)
    ("h" helm-next-source nil) ; No need for JOIN
    ("l" helm-previous-source nil)
    ("}" helm-next-source nil)
    ("{" helm-previous-source nil)
    ("C-o" helm-next-source nil)
    ("i" nil nil))
;;(define-key helm-map (kbd "<escape>") 'helm-like-unite/body)
;;(define-key helm-map (kbd "C-k") 'helm-like-unite/body)
;;(define-key helm-map (kbd "C-o") 'helm-like-unite/body)


(provide 'init-hydra)
