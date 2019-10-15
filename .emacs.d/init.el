(require 'package)
;(setq package-enable-at-startup nil)
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.org/packages"))

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

(defalias 'yes-or-no-p 'y-or-n-p)

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package evil
  :ensure t
  :init
  (evil-mode))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-tabs
  :ensure t
  :init
  (global-evil-tabs-mode) t)

(setq ring-bell-function 'ignore)

(global-hl-line-mode t)
(global-prettify-symbols-mode t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bd51a329aa9b8e29c6cf2c8a8cf136e0d2960947dfa5c1f82b29c9178ad89a27" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files
   (quote
    ("~/usr/src/tobal/notes/creator/it-professional/software-developer/programming.org" "~/usr/src/tobal/notes/self-sustainer/creativity-consumer/reading.org" "~/usr/src/tobal/notes/creator/it-professional/computer-user/online-profiles.org" "~/usr/src/tobal/notes/self-sustainer/body-wielder/body-maintenance.org" "~/usr/src/tobal/notes/creator/it-professional/data-scientist/artificial-intelligence.org" "~/usr/src/tobal/notes/spiritual-being/gamer/virtual-adventurer/online-games.org" "~/usr/src/tobal/notes/creator/it-professional/hacker/home-network.org" "~/usr/src/tobal/notes/creator/it-professional/computer-user/computer-maintenance.org" "~/usr/src/tobal/notes/self-sustainer/self-manager/organizer-system.org" "~/usr/src/tobal/notes/spiritual-being/gamer/virtual-pilot/virtual-driving.org" "~/usr/src/tobal/notes/spiritual-being/gamer/virtual-adventurer/open-world-games.org" "~/usr/src/tobal/notes/creator/it-professional/software-developer/freelancer.org" "~/usr/src/tobal/notes/self-sustainer/body-wielder/workout.org" "~/usr/src/tobal/notes/self-sustainer/cook/groceries.org" "~/usr/src/tobal/notes/self-sustainer/body-wielder/clothing.org" "~/usr/src/tobal/notes/society-participant/social-being/friends.org" "~/usr/src/tobal/notes/society-participant/social-being/family.org" "~/usr/src/tobal/notes/society-participant/dweller/apartment.org" "~/usr/src/tobal/notes/spiritual-being/warrior/swordsman/kenjutsu.org" "~/usr/src/tobal/notes/spiritual-being/magician/chaos-magician/meditation.org" "~/usr/src/tobal/notes/creator/artist/juggler/soft-props.org" "~/usr/src/tobal/notes/creator/artist/juggler/rigid-props.org" "~/usr/src/tobal/notes/creator/artist/role-player/four-simulations.org" "~/usr/src/tobal/notes/creator/artist/musician/singing.org" "~/usr/src/tobal/notes/creator/it-professional/software-developer/balabit.org" "~/usr/src/tobal/notes/society-participant/social-being/nihongo.org")))
 '(package-selected-packages
   (quote
    (evil org-bullets spacemacs-theme which-key use-package)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 190 :width normal :foundry "ADBO" :family "Source Code Pro")))))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

; Org-mode keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

; Org-mode TODO keywords
(setq org-todo-keywords
  '((sequence "TODO(t)" "INPROGRESS(i)" "BLOCKED(b)" "|" "DONE(d)" "DIDNTDO(n)" "COULDNTDO(u)" "CANCELED(c)")))
