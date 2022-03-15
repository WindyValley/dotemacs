(use-package company
	:ensure t
	:config
	(add-hook 'after-init-hook 'global-company-mode))

(use-package lsp-mode
	:ensure t)

(use-package company-box
	:ensure t
	:hook (company-mode . company-box-mode))

(provide 'init-devel)
