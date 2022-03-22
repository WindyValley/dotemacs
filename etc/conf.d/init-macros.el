;;; init-macros.el --- core macros  -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

(defmacro user-emacs-config-file (relativepath)
	"获取用户配置文件的完整路径"
	`(expand-file-name ,relativepath user-emacs-directory)
	)

(provide 'init-macros)

;;; init-macros.el ends here
