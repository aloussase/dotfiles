(require 'package)

(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
    ("org" . "https://orgmode.org/elpa/")
    ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(use-package no-littering
  :ensure t)

(setq
  custom-file "~/.emacs.d/custom.el"
  make-backup-files nil)

(auto-save-mode -1)

;;; Disable UI clutter
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(setq visible-bell 1)

(column-number-mode)
(global-display-line-numbers-mode t)

;;; Colorscheme
(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-ayu-dark t))

;;; Modeline
(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha 0.9)
(add-to-list 'default-frame-alist `(alpha . ,0.9))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;; Font configuration
(use-package emacs
  :init
  (set-face-attribute 'default nil :font "Hasklug Nerd Font Mono" :height 120))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 't '(">>="))
  (global-ligature-mode t))

;;; Whitespace
(use-package whitespace
  :hook ((before-save . untabify)
         (before-save . delete-trailing-whitespace))
  :init
  (setq-default indent-tabs-mode nil)
  (setq whitespace-style '(face trailing tabs newline newline-mark))
  (global-whitespace-mode 1))

;;; Keybingings & Editing
(use-package emacs
  :bind (("<escape>" . keyboard-escape-quit))
  :config (electric-pair-mode 1))

(use-package evil
  :ensure t
  :init (setq evil-want-integration t
              evil-want-keybinding nil
              evil-want-C-u-scroll t
              evil-want-C-i-jump nil
              evil-undo-system 'undo-redo)
  :config (evil-mode t))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package string-inflection
  :ensure t)

;;; Completion
(use-package company
  :ensure t
  :init
  (setq company-tooltip-align-annotations t)
  :hook (after-init . global-company-mode))

;;; Minibuffer
(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)))

;;; Fuzzy finding
(use-package consult
  :ensure t
  ;; :init (setq consult-preview-key nil)
  :config
  (evil-leader/set-key
    "f b" #'consult-buffer
    "f g" #'consult-ripgrep
    "f f" #'consult-find
    "f e" #'consult-compile-error
    "f d" #'consult-flymake
    "f c" #'consult-theme))

;;; Git
(use-package diff-hl
  :ensure t
  :init (global-diff-hl-mode))
