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

(use-package org-roam
  :ensure nil
  :disabled
  :custom
  (org-roam-directory org-directory)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(use-package org-roam-ui
	:ensure nil
	:disabled
	:after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(provide 'init-org)
