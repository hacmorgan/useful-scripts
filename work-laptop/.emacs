
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Initialise evilmode
(add-to-list 'load-path "~/.emacs.d/evil")

;; Initialise org mode
(add-to-list 'load-path "~/.emacs.d/org")

;; Initialise cyberpunk theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/cyberpunk/")

;; Initialise htmlize (allows code snippets to be rendered in html)
(add-to-list 'load-path "~/.emacs.d/emacs-htmlize")

;; Initialise markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")

;; Use evilmode
(require 'evil)
(evil-mode 1)

;; Change meta key to super
(setq x-super-keysym 'meta)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
	("1a232652b04b68380b1cff7ceeb62787b4eb43df826a97c67831c50b0c0d1451" default)))
 '(display-line-numbers (quote relative))
 '(electric-pair-inhibit-predicate (quote electric-pair-conservative-inhibit))
 '(electric-pair-mode t)
 '(electric-pair-pairs (quote ((34 . 34) (8220 . 8221) (39 . 39))))
 '(electric-pair-preserve-balance t)
 '(electric-quote-string nil)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil nil nil "Enables the menu bar")
 '(org-support-shift-select nil)
 '(package-selected-packages (quote (markdown-mode company auto-overlays)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "violet")))))

;; Resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Move between windows
(windmove-default-keybindings)

;; Set where emacs stores its backup files, and make sure it backs up by copying the file
(setq backup-directory-alist `(("." . "~/.emacs_backups")))
(setq backup-by-copying t)

;; Set python to indent by tabs
(setq-default tab-width 4)
(setq python-indent-tabs-mode t)

;; Make windmove work in Org mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Make word wrap apply in org mode
;;(add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Turn on autocomplete
(add-hook 'after-init-hook 'global-company-mode)

;; Set c indent mode
(setq-default c-basic-offset 4)

;; Enable melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Meta + bracket to insert a pair around a block of text
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
