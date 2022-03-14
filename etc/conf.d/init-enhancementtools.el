(use-package which-key
  :ensure t
  :custom
  (which-key-popup-type 'side-window)
  :config
  (which-key-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0 :foreground "magenta")))))))

;; 增强了搜索功能
(use-package swiper
  :bind
  (("C-s" . swiper)
   ("C-r" . swiper)
   ("C-c C-r" . ivy-resume)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

;; 集成了很多非常有用的的功能
(use-package counsel
  :hook
  ('counsel-mode . 'dashboard-mode)
  :ensure t
  :bind
  (("C-x C-r" . 'counsel-recentf) 
   ("C-x d" . 'counsel-dired))
  :config
  ;; Integration with `projectile'
  (with-eval-after-load 'projectile
    (setq projectile-completion-system 'ivy)))

;; 强大的跳转工具
(use-package avy 
  :ensure t
  :bind (("M-g :" . 'avy-goto-char)
         ("M-g '" . 'avy-goto-char-2)
         ("M-g \"" . 'avy-goto-char-timer)
         ("M-g f" . 'avy-goto-line)
         ("M-g w" . 'avy-goto-word-1)
         ("M-g e" . 'avy-goto-word-0)))

;; 括号匹配
(use-package smartparens 
  :ensure t 
  :hook ('prog-mode . 'smartparens-global-mode))

;; 撤销树
(use-package undo-tree 
  :ensure t 
  :hook (after-init . global-undo-tree-mode) 
  :init (setq undo-tree-visualizer-timestamps t undo-tree-enable-undo-in-region nil undo-tree-auto-save-history nil)
  ;; HACK: keep the diff window
  (with-no-warnings (make-variable-buffer-local 'undo-tree-visualizer-diff) 
                    (setq-default undo-tree-visualizer-diff t)))
;; 项目管理
(use-package projectile 
  :ensure t)

(provide 'init-enhancementtools)
