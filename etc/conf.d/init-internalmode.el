;; 回到上一次光标的位置
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package newcomment
  :ensure nil
  :bind ([remap comment-dwim] . #'comment-or-uncomment)
  :config
  (defun comment-or-uncomment ()
    (interactive)
    (if (region-active-p)
        (comment-or-uncomment-region (region-beginning) (region-end))
      (if (save-excursion
            (beginning-of-line)
            (looking-at "\\s-*$"))
          (call-interactively 'comment-dwim)
        (comment-or-uncomment-region (line-beginning-position) (line-end-position)))))
  :custom
  (comment-auto-fill-only-comments t))

;; 折叠和收缩代码
(use-package hideshow 
  :ensure t 
  :diminish hs-minor-mode 
  :bind (:map prog-mode-map
              ("C-c TAB" . hs-toggle-hiding) 
              ("C-c p +" . hs-show-all)
              ) 
  :hook (prog-mode . hs-minor-mode))

(provide 'init-internalmode)
