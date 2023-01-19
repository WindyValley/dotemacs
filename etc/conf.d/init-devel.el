(use-package company
	:ensure t
	:bind (:map company-mode-map
				 ([remap completion-at-point] . company-complete)
				 :map company-active-map
				 ([tab] . company-complete-common-or-cycle)
				 ([backtab] . company-select-previous-or-abort))
	:config
	(add-hook 'after-init-hook 'global-company-mode)
	:custom
	(company-idle-delay 0)
	(company-show-quick-access t)
	(company-require-match nil)
	(company-files-exclusions '(".git/" ".DS_Store")))

(use-package lsp-mode
	:ensure t
	:hook (c++-mode . lsp-deferred)
	:bind (:map lsp-mode-map
							("C-c f" . lsp-format-region)
							("C-c d" . lsp-describe-thing-at-point)
							("C-c a" . lsp-execute-code-action)
							("C-c r" . lsp-rename))
	:config
	(with-no-warnings (lsp-enable-which-key-integration t))
	:custom
	(lsp-keymap-prefix "C-c l")
  (lsp-enable-links nil)                    ;; no clickable links
  (lsp-enable-folding nil)                  ;; use `hidetshow' instead
  (lsp-enable-snippet nil)                  ;; no snippets, it requires `yasnippet'
  (lsp-enable-file-watchers nil)            ;; performance matters
  (lsp-enable-text-document-color nil)      ;; as above
  (lsp-enable-symbol-highlighting nil)      ;; as above
  (lsp-enable-on-type-formatting nil)       ;; as above
  (lsp-enable-indentation nil)              ;; don't change my code without my permission
  (lsp-semantic-tokens-apply-modifiers nil) ;; don't override token faces
  (lsp-headerline-breadcrumb-enable nil)    ;; keep headline clean
  (lsp-modeline-code-actions-enable nil)    ;; keep modeline clean
  (lsp-modeline-diagnostics-enable nil)     ;; as above
  (lsp-log-io nil)                          ;; debug only
  (lsp-auto-guess-root t)                   ;; Yes, I'm using projectile
  (lsp-keep-workspace-alive nil)            ;; auto kill lsp server
  (lsp-eldoc-enable-hover nil)              ;; disable eldoc hover
	)

(use-package company-box
	:ensure t
	:hook (company-mode . company-box-mode))

(provide 'init-devel)
