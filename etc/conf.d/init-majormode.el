(use-package nxml-mode
	:ensure nil
	:mode (("\\.xml\\'" . nxml-mode)
				 ("\\.rss\\'" . nxml-mode)
				 ("\\.qrc\\'" . nxml-mode))
	:custom
	(nxml-slash-auto-complete-flag t)
	(nxml-auto-insert-xml-declaration-flag t))

(use-package yaml-mode
	:ensure t
	:mode ("\\.ya?ml\\'" . yaml-mode))

(provide 'init-majormode)
