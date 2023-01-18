(if (not (display-graphic-p))
		(add-hook 'after-make-frame-functions
							(lambda (new-frame)
								(select-frame new-frame)
								(dolist (elisp-code graphic-only-plugins-settings)
									(eval elisp-code))))
	(dolist (elisp-code graphic-only-plugins-settings)
		(eval elisp-code)))

(provide 'init-graphic)
