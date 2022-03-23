(use-package org
	:ensure nil
	:hook (org-mode . visual-line-mode)
	:custom
	(org-default-notes-file (expand-file-name "notes.org" org-directory))
	(org-display-inline-images 'cache))

(use-package org-agenda
	:ensure nil
	:hook (org-agenda-finalize . org-agenda-to-appt)
	:custom
	(org-agenda-files (list (expand-file-name "TODO.org" org-directory)))
	(org-diary-file (expand-file-name "diary.org" org-directory))
	(org-agenda-insert-diary-extract-time t)
	(org-agenda-restore-windows-after-quit t)
	(org-agenda-window-setup 'current-window)
	)

(use-package org-superstar
	:ensure t
	:config
	(add-hook 'org-mode-hook (lambda ()
														 (org-superstar-mode 1))))

(provide 'init-org)
