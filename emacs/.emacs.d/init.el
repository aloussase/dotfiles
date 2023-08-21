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
(set-face-attribute 'default nil :font "Hasklug Nerd Font Mono" :height 120)
(use-package ligature
  :ensure t 
  :config
  (ligature-set-ligatures 't '(">>="))
  (global-ligature-mode t))

;;; Keybingings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode t))

;;; Editing
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
