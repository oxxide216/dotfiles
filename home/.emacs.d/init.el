(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defun install-packages (packages)
  (dolist (package packages)
    (unless (package-installed-p package)
      (package-install package))))

(setq packages '(ido-completing-read+
 								 smex
								 company
								 magit
								 dumb-jump
								 zenburn-theme
								 doom-themes))
(install-packages packages)

(indent-tabs-mode nil)
(setq-default tab-width 2)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

(set-face-attribute 'default nil :height 120)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

(ido-mode 1)
(ido-ubiquitous-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(global-set-key (kbd "M-x") 'smex)

(company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)

(load-file "~/.emacs.d/simpc-mode.el")
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(load-theme 'doom-vibrant)

(global-set-key (kbd "C-x c") 'compile)
