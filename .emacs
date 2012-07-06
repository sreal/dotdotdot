 ; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/Extensions/")
(add-to-list 'load-path "~/.emacs.d/Extensions/themes/")
(add-to-list 'load-path "~/Evernote/Evernote") ; Path to evernote datebase

(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq inhibit-splash-screen     t)
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files

(setq vc-follow-symlinks        t);
(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening

(setq c-default-style "bsd" c-basic-offset 4)
(setq-default truncate-lines t)     ; Set long lines
(setq default-directory "C:\\projects" )
(setq initial-scratch-message nil)  ; Clear scratch message
                                    ; pyhton setup (tab vs spaces) - http://www.python.org/dev/peps/pep-0008/
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq visible-bell t)               ; Turn off the bell


;(set-default-font "Consolas-9")    ; Consolas all the way
(subword-mode 1)                   ; CamelCase
(global-subword-mode)
(menu-bar-mode -1)                 ; No Menu
(tool-bar-mode -1)                 ; No ToolBar
(normal-erase-is-backspace-mode 1) ; make the backspace act as delete
(delete-selection-mode 1)          ; Overwrite selection

(add-hook 'before-save-hook 'whitespace-cleanup) ; nuke whitespaces when writing to a file


;;csharp
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq csharp-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
; powershell
(autoload 'powershell "powershell" "Start a interactive shell of PowerShell." t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.psm1\\'" . powershell-mode))
(autoload 'powershell-mode "powershell-mode" "Major mode for editing PowerShell code." t)
;VBScript editing
(autoload 'visual-basic-mode "visual-basic-mode" "Major mode for editing visual basic." t)
(autoload 'vbscript-mode "vbs-repl" "vbs-repl" t)
(setq auto-mode-alist
      (append '(("\\.\\(vbs\\|wsf\\)$" . vbscript-mode))
              auto-mode-alist))

; auto-complete extension
;(require 'auto-complete)
;(global-auto-complete-mode t)

; Interactively Do Things
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")

; Color Theme
:(require 'color-theme)
:(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-vim-colors)
;;(color-theme-comidia)
;;(color-theme-whateveryouwant)

; Evernote
(require 'evernote-mode)
(setq evernote-username "simoneames") ; optional: you can use this username as default.

; Custom Functions
(defun copy-line ()
      "Copy line"
      (interactive)
      (kill-ring-save (line-beginning-position 1)
                      (line-end-position 1))
      (beginning-of-line 2)
      (yank)
      (newline)
      (previous-line)
      (message "Line copied" ))
(defun copy-buffer ()
      "Copy buffer"
      (interactive)
      (mark-whole-buffer)
      (copy-region-as-kill (region-beginning) (region-end))
      (message "Buffer copied" ))
(defun overwrite-buffer ()
      "Overwrite buffer"
      (interactive)
      (erase-buffer)
      (yank)
      (message "Buffer paste" ))

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-c\C-c" 'copy-line)
(global-set-key "\C-c\C-a" 'copy-buffer)
(global-set-key "\C-c\C-v" 'overwrite-buffer)
