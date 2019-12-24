
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
 '(doc-view-continuous t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil nil nil "Enables the menu bar")
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
;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


;; Set where emacs stores its backup files, and make sure it backs up by copying the file
(setq backup-directory-alist `(("." . "~/.emacs_backups")))
(setq backup-by-copying t)

;; Set python to indent by tabs
(setq-default tab-width 4)
(setq python-indent-tabs-mode t)


;; (add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
