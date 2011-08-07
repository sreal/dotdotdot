; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/Extensions/")
(add-to-list 'load-path "~/.emacs.d/Extensions/themes/")

(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq inhibit-splash-screen     t)
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq vc-follow-symlinks        t);

(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

(normal-erase-is-backspace-mode 1) ; make the backspace act as delete

; pyhton setup (tab vs spaces) - http://www.python.org/dev/peps/pep-0008/
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; auto-complete extension
;(require 'auto-complete)
;(global-auto-complete-mode t)

;;Turn on documentation in elisp mode
;(add-hook 'emacs-lisp-mode-hook
;          '(lambda ()
;	     (turn-on-eldoc-mode)))

; Interactively Do Things
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")

;;csharp
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
; powershell
(autoload 'powershell "powershell" "Start a interactive shell of PowerShell." t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.psm1\\'" . powershell-mode))
(autoload 'powershell-mode "powershell-mode" "Major mode for editing PowerShell code." t)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;;(set-default-font "Consolas-11.5:bold")

(setq c-default-style "bsd" c-basic-offset 4)
(setq-default truncate-lines t) ;; Set long lines
(subword-mode 1)                ;;CamelCase
(global-subword-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'color-theme)
(color-theme-initialize)
;;(setq color-theme-is-global t)
;;(color-theme-comidia)
;;(color-theme-whateveryouwant)


(setq csharp-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))


;; Set the CWD current working diretory
(setq default-directory "C:\\projects\\My Dropbox\\ice\\cadetnet-cmc4" )



;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))
;; Set transparency of emacs
(defun transparency (value)
 "Sets the transparency of the frame window. 0=transparent/100=opaque"
 (interactive "nTransparency Value 0 - 100 opaque:")
 (set-frame-parameter (selected-frame) 'alpha value))

