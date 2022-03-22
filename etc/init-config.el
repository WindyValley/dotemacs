(setq graphic-only-plugins-settings ())
(require 'init-macros)

(if (file-exists-p (expand-file-name "etc/conf.d/init-custom.el" user-emacs-directory))
		(require 'init-custom)
	(progn
		(message "自定义配置文件不存在，将拷贝默认配置")
		(copy-file (user-emacs-config-file "etc/conf.d/default_of_custom.el") (user-emacs-config-file "etc/conf.d/init-custom.el"))
		(require 'init-custom)
		))

(require 'init-editor)
(require 'init-package)
(require 'init-internalmode)
(require 'init-enhancementtools)
(require 'init-ui)
(require 'init-devel)
(require 'init-org)

(require 'init-graphic)
(provide 'init-config)
