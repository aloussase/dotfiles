(use-package clang-format
  :ensure t
  :hook (before-save . clang-format-buffer)
  :bind (("C-c C-f" . clang-format-buffer)))

(provide 'cxx)
