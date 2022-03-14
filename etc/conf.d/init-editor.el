(set-language-info
 "UTF-8"
 'coding-priority
 '(utf-8 gb18030 gbk gb2312 iso-2022-cn chinese-big5 chinese-iso-8bit iso-8859-1))
(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; 关闭工具栏与滚动条
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; 自动刷新被修改过的文件
(global-auto-revert-mode 1)
;; 选中文本后输入会覆盖
(delete-selection-mode 1)
;; 高亮当前行
(global-hl-line-mode 1)

;; 禁用启动界面
(setq inhibit-startup-screen t
			inhibit-startup-message t)
;; 关闭备份文件
(setq make-backup-files nil)

;; 回到上一次光标的位置
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

;; 更友好和平滑的滚动
(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position 'always)

;; 关闭自动调节行高
(setq auto-window-vscroll nil)

;; 创建新行的动作
(global-set-key (kbd "RET") 'newline-and-indent) 
(global-set-key (kbd "S-<return>") 'comment-indent-new-line)

;; 设置 tab 宽度
(setq-default tab-width 2)
(setq tab-width 2)
(setq-default indent-tabs-mode t)

(use-package which-key
  :ensure t
  :custom
  (which-key-popup-type 'side-window)
  :config
  (which-key-mode))

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

(provide 'init-editor)
