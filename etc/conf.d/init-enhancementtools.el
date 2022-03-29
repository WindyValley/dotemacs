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

;; 美化ivy(swiper和counsel)
(push '(progn
		 ;;美化
		 (use-package
		   all-the-icons-ivy-rich
		   :ensure t
		   :init (all-the-icons-ivy-rich-mode 1))
		 (use-package
		   ivy-rich
		   :ensure t
		   :init (ivy-rich-mode 1)
		   (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
		   :config
			 (setq ivy-rich-display-transformers-list
						 '(ivy-switch-buffer (:columns
																	((ivy-rich-switch-buffer-icon (:width 2))
																	 (ivy-rich-candidate (:width 30))
																	 (ivy-rich-switch-buffer-size (:width 7))
																	 (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
																	 (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
																	 (ivy-rich-switch-buffer-project (:width 15 :face success))
																	 (ivy-rich-switch-buffer-path (:width (lambda (x)
																																					(ivy-rich-switch-buffer-shorten-path x
																																						(ivy-rich-minibuffer-width 0.3))))))
																	:predicate (lambda (cand)
																							 (get-buffer cand)))
						  counsel-find-file (:columns ((ivy-read-file-transformer)
																					 (ivy-rich-counsel-find-file-truename (:face font-lock-doc-face))))
						  counsel-M-x (:columns ((counsel-M-x-transformer (:width 40))
																		 (ivy-rich-counsel-function-docstring (:face font-lock-doc-face)))) ; return docstring of the command
						  counsel-recentf (:columns ((ivy-rich-candidate (:width 0.8))
																				 (ivy-rich-file-last-modified-time
																					 (:face font-lock-comment-face)))) ; return last modified time of the file
						  counsel-describe-function (:columns
															   ((counsel-describe-function-transformer (:width 40))
																	(ivy-rich-counsel-function-docstring (:face font-lock-doc-face)))) ; return docstring of the function
							counsel-describe-variable (:columns
															   ((counsel-describe-variable-transformer (:width 40))
																	(ivy-rich-counsel-variable-docstring (:face font-lock-doc-face)))) ; return docstring of the variable
															  )))
		 ;; 美化
		 (use-package
		   ivy-posframe
		   ;; :disabled
		   :ensure t
		   :init (ivy-posframe-mode 1)
		   :custom (ivy-posframe-parameters '((left-fringe . 8)
											  (right-fringe . 8)))
		   (ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center))))) graphic-only-plugins-settings)
 
;; counsel提供对项目管理的支持
(use-package 
  counsel-projectile 
  :ensure t 
  :hook ((counsel-mode . counsel-projectile-mode)) 
  :init (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point)) 
  :bind (:map leader-key
              ("p" . #'projectile-command-map)))

(use-package neotree
	:ensure t
	:bind (("<f8>" . 'neotree-toggle))
	:custom
	(neotheme (if (display-graphic-p) 'icon 'arrow)))

(provide 'init-enhancementtools)
