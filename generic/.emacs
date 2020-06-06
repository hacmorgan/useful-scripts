
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq use-package-always-pin  "melpa-stable")
(package-initialize)

;; Download use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Reduce load time
(eval-when-compile (require 'use-package))

;; Initialise evilmode
(add-to-list 'load-path "~/.emacs.d/evil")

;; Initialise org mode
(add-to-list 'load-path "~/.emacs.d/org")

;; Initialise cyberpunk theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/cyberpunk/")

(require 'evil)
(evil-mode 1)
(setq x-super-keysym 'meta)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-statistics-mode t)
 '(custom-enabled-themes (quote (cyberpunk)))
 '(custom-safe-themes
   (quote
	("5adf7ad078568675387aac96e142c1300006531721bca35b941e4ed3e3b59000" "1a232652b04b68380b1cff7ceeb62787b4eb43df826a97c67831c50b0c0d1451" default)))
 '(display-line-numbers (quote relative))
 '(doc-view-continuous t)
 '(electric-pair-mode t)
 '(global-company-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil nil nil "Enables the menu bar")
 '(package-selected-packages
   (quote
    (csv-mode magit haskell-mode ein markdown-mode company)))
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


;; (add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Autoload octave mode on .m files
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; attempt to fix weird errors when ssh-ing using keys
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;; emms
(use-package emms
  :ensure t
  :config
    (require 'emms-setup)
    (require 'emms-player-mpd)
    (emms-all) ; don't change this to values you see on stackoverflow questions if you expect emms to work
    (setq emms-seek-seconds 5)
    (setq emms-player-list '(emms-player-mpd))
    (setq emms-info-functions '(emms-info-mpd))
    (setq emms-player-mpd-server-name "localhost")
    (setq emms-player-mpd-server-port "6600")
    (setq emms-add-directory-tree "/mnt/storage/Music")
  :bind
    ("M-p p" . emms)
    ("M-p b" . emms-smart-browse)
    ("M-p r" . emms-player-mpd-update-all-reset-cache)
    ("<XF86AudioPrev>" . emms-previous)
    ("<XF86AudioNext>" . emms-next)
    ("<XF86AudioPlay>" . emms-pause)
    ("<XF86AudioStop>" . emms-stop))



    
