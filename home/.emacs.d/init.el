(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load-file custom-file))

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
                 multiple-cursors
                 zenburn-theme
                 doom-themes))
(install-packages packages)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

(defun lnos-activate ()
  (interactive)
  (setq-default tab-width 4))

(defun default-activate ()
  (interactive)
  (setq-default tab-width 2))

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

(company-mode)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)

;; (load-file "~/.emacs.d/simpc-mode.el")
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(load-theme 'doom-vibrant)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x c") 'compile)
(global-set-key (kbd "M-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<up>") 'mc/mark-previous-like-this)
