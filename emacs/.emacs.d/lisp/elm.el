(use-package elm-mode
  :ensure t
  :init (setq elm-mode-hook '(elm-indent-simple-mode))
  :hook (elm-mode . elm-format-on-save-mode))

(provide 'elm)
