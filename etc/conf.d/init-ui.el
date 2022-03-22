(push '(progn
				 (set-face-attribute 'default nil :font
														 (font-spec :family (car fonts) :size 15))
				 (dolist (charset '(kana han symbol cjk-misc bopomofo))
					 (set-fontset-font (frame-parameter nil 'font) charset
														 (font-spec :family (car (cdr fonts)) :size 18)))

;; (setq fonts '("Sarasa Mono SC Nerd"))
;; (set-face-attribute 'default nil :font
;; 										(font-spec :family (car fonts) :size 18))
				 (add-to-list 'default-frame-alist '(fullscreen . maximized))
				 )
			graphic-only-plugins-settings)

(use-package dracula-theme
	:ensure t
	:init (load-theme 'dracula t)
	:config
	(setq dracula-alternate-mode-line-and-minibuffer t))

;; 相对行号
(use-package emacs
	:ensure t
	:config
	(setq display-line-numbers-type 'relative)
	(global-display-line-numbers-mode t))

;; 缩进线
(use-package indent-guide
	:ensure t
	:hook (prog-mode . indent-guide-mode))

;; 彩虹猫进度条
(use-package nyan-mode
	:if (not (boundp 'awesome-tray-mode))
	:ensure t
	:hook (after-init . nyan-mode)
	:config
	(setq nyan-wavy-trail t
				nyan-animate-nyancat t))

;; 彩虹括号
(use-package 
  rainbow-delimiters 
  :ensure t
  :config
  ;; 设置每一级括号的颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "orange red") 
  (set-face-foreground 'rainbow-delimiters-depth-2-face "gold") 
  (set-face-foreground 'rainbow-delimiters-depth-3-face "yellow") 
  (set-face-foreground 'rainbow-delimiters-depth-4-face "spring green") 
  (set-face-foreground 'rainbow-delimiters-depth-5-face "cyan") 
  (set-face-foreground 'rainbow-delimiters-depth-6-face "magenta") 
  (set-face-foreground 'rainbow-delimiters-depth-7-face "goldenrod") 
  (set-face-foreground 'rainbow-delimiters-depth-8-face "IndianRed1") 
  (set-face-foreground 'rainbow-delimiters-depth-9-face "ivory1") 
  (set-face-bold 'rainbow-delimiters-depth-1-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-2-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-3-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-4-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-5-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-6-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-7-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-8-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-9-face "t")
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package all-the-icons 
  :ensure t) 
(use-package all-the-icons-dired 
  :ensure t 
  :hook ('dired-mode . 'all-the-icons-dired-mode)) 
(use-package posframe 
  :ensure t)

(use-package dashboard 
  :ensure t
  :config (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text") 
                                    (bookmarks . "book")))
  (setq dashboard-center-content t) 
  (setq dashboard-set-heading-icons t) 
  (setq dashboard-set-navigator t))

(provide 'init-ui)
