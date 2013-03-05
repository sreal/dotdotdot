 ; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/Extensions/")
(add-to-list 'load-path "~/.emacs.d/Extensions/themes/")
(add-to-list 'load-path "~/Evernote/Evernote")

(setq inhibit-startup-message   t)   ; Don't want any startup message
(setq inhibit-splash-screen     t)   ; Or Start screen
(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq vc-follow-symlinks        t)  ;
(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening
(setq c-default-style "bsd" c-basic-offset 4) ; bsd style
(setq-default truncate-lines t)     ; Set long lines
(setq default-directory "C:\\projects" ) ; default to project directory
(setq initial-scratch-message nil)  ; Clear scratch message
(setq-default indent-tabs-mode nil) ; python setup (tab vs spaces) - http://www.python.org/dev/peps/pep-0008/
(setq-default tab-width 4)          ; python setup (tab vs spaces) - http://www.python.org/dev/peps/pep-0008/

(setq line-number-mode t)               ; Line number
(setq column-number-mode t)            ; Column number
(setq visible-bell t)               ; Turn off the bell
(set-default-font "monofur-13")     ; monofur custom font
;(set-default-font "Consolas-9")    ; Consolas all the way
(subword-mode 1)                    ; CamelCase
(global-subword-mode)
(menu-bar-mode -1)                 ; No Menu
(tool-bar-mode -1)                 ; No ToolBar
(normal-erase-is-backspace-mode 1) ; make the backspace act as delete
(delete-selection-mode 1)          ; Overwrite selection
(add-hook 'before-save-hook 'whitespace-cleanup) ; nuke whitespaces when writing to a file

;; Color Theme
:(require 'color-theme)
:(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-dark-laptop)        ; color-theme-dark-laptop
;;(color-theme-vim-colors)       ; or vim


; Languages
;; csharp
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
; vbscript
(autoload 'visual-basic-mode "visual-basic-mode" "Major mode for editing visual basic." t)
(autoload 'vbscript-mode "vbs-repl" "vbs-repl" t)
(setq auto-mode-alist
      (append '(("\\.\\(vbs\\|wsf\\)$" . vbscript-mode))
              auto-mode-alist))

; auto-complete extension
;(require 'auto-complete)
;(global-auto-complete-mode t) ; enable for auto complete

; Interactively Do Things
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")


;guru mode
;; (require 'guru-mode)
;; (guru-global-mode +1) ; enable to bring the pain https://github.com/bbatsov/guru-mode

; Evernote
(require 'evernote-mode)
(setq evernote-username "simoneames") ; default to me.


; ace jump mode major function
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)
; enable a more powerful jump back function from ace jump mode
;;(autoload
;;  'ace-jump-mode-pop-mark
;;  "ace-jump-mode"
;;  "Ace jump back:-)"
;;  t)
;;(eval-after-load "ace-jump-mode"
;;  '(ace-jump-mode-enable-mark-sync))
;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


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


(defun ming-shell ()
  "Run mingw32 in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:/Program Files (x86)/Git/bin/sh")
        (explicit-sh-args '("--login" "-i") ))
    (call-interactively 'shell)))
(setq tramp-shell-prompt-pattern "^[^\\$$][\\$$] *")
(setq tramp-default-method "ssh")
