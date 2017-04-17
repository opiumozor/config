;; Remove (the useless) startup message
(setq inhibit-startup-message t)

;; Remove top menu bar
(menu-bar-mode 0)

;; Better scrolling
(setq scroll-step 1)
(setq scroll-preserve-screen-position t)

;; Mini-buffer auto-complete
(icomplete-mode 1)

;; Colorized parenthesis
(custom-set-variables
 '(show-paren-mode t))
(custom-set-faces)

;; Replace 'yes' by 'y' & 'no' by 'n'
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line and column number
(column-number-mode t)
(line-number-mode t)

;; Ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Color terminal emulator
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Auto-pair
(add-to-list 'load-path "~/.config/emacs/dot.emacs.d/autopair")
(require 'autopair)
(autopair-global-mode)

;; Enable C mode (you never know!)
(require 'cc-mode)

;; C indentation config
(setq-default c-basic-offset 2 c-default-style "gnu")

;; Reduce fonction with F1
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key [f1] 'hs-hide-block)

;; Increase fonction with F2
(global-set-key [f2] 'hs-show-block)

;; Open man with F3
(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))
(global-set-key [f3] 'vectra-man-on-word)

;; Auto-complete mod
(add-to-list 'load-path "~/.config/emacs/dot.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.config/emacs/dot.emacs.d/auto-complete/dict")
(ac-config-default)

;; Header generation
(add-to-list 'load-path "~/.config/emacs/dot.emacs.d/header")
(require 'header2)
(add-hook 'write-file-hooks 'auto-update-file-header)
(global-set-key (kbd "C-x C-h") 'make-header)
(setq header-author 'user-full-name)
(setq header-file-name 'buffer-file-name)
(setq header-creation-date 'current-time-string)
(setq header-modification-author 'user-full-name)
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook   'auto-make-header)
(add-hook 'python-mode-hook   'auto-make-header)
(add-hook 'cperl-mode-hook   'auto-make-header)
(add-hook 'c-mode-hook   'auto-make-header)
(add-hook 'makefile-mode-hook   'auto-make-header)
(add-hook 'sh-mode-hook   'auto-make-header)

;; Higlight line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#333333")
(set-face-foreground 'highlight nil)

;; Custom theme
(add-to-list 'custom-theme-load-path "~/.config/emacs/dot.emacs.d/themes")
(load-theme 'ample t)

;; 80 column rule
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)
(set-face-attribute 'whitespace-line nil
                    :foreground "#121212"
                    :background "#C21010"
                    :weight 'bold)

;; Don't use TABS for indentations. (TABS ARE BAD!)
(setq-default indent-tabs-mode nil)

;; Remove white space (must be after header generation)
(add-hook 'after-save-hook 'delete-trailing-whitespace)

;; Move autosave files (#foo#) and backup files (foo~) in ~/.config/emacs/dot.emacs.d/
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.config/emacs/dot.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.config/emacs/dot.emacs.d/backups/"))))
(make-directory "~/.config/emacs/dot.emacs.d/autosaves/" t)

;; Switch between buffers
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Scala mode
(add-to-list 'load-path "~/.config/emacs/dot.emacs.d/scala-mode2/")
(require 'scala-mode2)
