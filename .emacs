;;============================================================================;;
; load paths                                                                   ;
(add-to-list 'load-path "~/.emacs.d/")                                         ;
(add-to-list 'load-path "~/.emacs.d/Extensions/")                              ;
(add-to-list 'load-path "~/.emacs.d/Extensions/themes/")                       ;
(add-to-list 'load-path "~/.emacs.d/Extensions/auto-complete")                 ;
(add-to-list 'load-path "~/.emacs.d/Extensions/yasnippet")                     ;
(add-to-list 'load-path "~/.emacs.d/Extensions/lintnode")                      ;
(add-to-list 'load-path "~/.emacs.d/Extensions/python-mode")                   ;


;;============================================================================;;
; System Specific                                                              ;
(if (string= system-type "darwin")                                             ;
  (progn
    (add-to-list 'exec-path "/Library/Frameworks/Python.framework/Versions/2.7/bin/")
    (add-to-list 'exec-path "/usr/local/bin/")                                 ;
    (setq default-directory "/Users/simoneames/projects/current")              ;
    (setq lintnode-location "/Users/simoneames/projects/products/lintnode")) ) ;
                                                                               ;
(if (string= system-type "linux")                                              ;
  (progn                                                                       ;
    (setq default-directory "~/projects")                                      ;
    (setq lintnode-location "~/products/lintnode")) )                          ;
                                                                               ;
(if (string= system-type "MIGW32_NT-6.2")                                      ;
  (progn                                                                       ;
    (add-to-list 'exec-path "C:\\python273")                                   ;
    (add-to-list 'exec-path "C:\\python273\\Scripts")                          ;
    (setq default-directory "C:\\Projects\\projects-current\\")                ;
    (setq lintnode-location "C:\\Projects\\projects-products\\")) )            ;


;;============================================================================;;
; Requires                                                                     ;
(require 'color-theme)                                                         ;
(require 'ido)                                                                 ;
(require 'yasnippet)                                                           ;
(require 'angular-snippets)                                                    ;
(require 'flymake-cursor)                                                      ;
(require 'python-mode)                                                         ;
(require 'fill-column-indicator)                                               ;
;;(require 'auto-complete-config)                                              ;
;; (require 'flymake-jslint)                                                   ;


;;============================================================================;;
;; Bindings                                                                    ;
(global-set-key "\C-w" 'backward-kill-word)                                    ;
(global-set-key "\C-x\C-k" 'kill-region)                                       ;
(global-set-key "\C-c\C-k" 'kill-region)                                       ;
                                                                               ;
(setq inhibit-startup-message    t)               ; Don't want any startup message
(setq inhibit-splash-screen      t)               ; Or Start screen            ;
(setq make-backup-files          nil)             ; Don't want any backup files;
(setq auto-save-list-file-name   nil)             ; Don't want any .saves files;
(setq vc-follow-symlinks         t)               ; sym links                  ;
                                                                               ;
(setq search-highlight           t)               ; Highlight search object    ;
(setq query-replace-highlight    t)               ; Highlight query object     ;
(setq mouse-sel-retain-highlight t)               ; Keep mouse high-lightening ;
(setq c-default-style "bsd")                      ; bsd style                  ;
(setq-default truncate-lines     t)               ; Set long lines             ;
(setq initial-scratch-message    nil)             ; Clear scratch message      ;
                                                                               ;
(setq-default indent-tabs-mode   nil)             ; spaces instead of tabs     ;
(setq indent-line-function 'insert-tab)           ; indent instead of moving forward
(setq-default tab-width 2)                        ; default 2 spaces for tabs  ;
(setq js-indent-level 2)                          ; 2 space javascript indent  ;
(add-hook 'python-mode-hook                       ; 4 space python indent      ;
           (function (lambda ()                   ;                            ;
                       (setq indent-tabs-mode nil ;                            ;
                             tab-width 4))))      ;                            ;
                                                                               ;
(setq line-number-mode           t)               ; Line number                ;
(setq column-number-mode         t)               ; Column number              ;
(setq visible-bell               t)               ; Turn off the bell          ;
                                                                               ;
(set-default-font "monofur-19")                   ; monofur custom font, big   ;
;(set-default-font "Consolas-9")                  ; Consolas alternate         ;
(subword-mode                    1)               ; CamelCase                  ;
(global-subword-mode)                             ; subword mode for everyone  ;
(menu-bar-mode                  -1)               ; No Menu                    ;
(tool-bar-mode                  -1)               ; No ToolBar                 ;
(normal-erase-is-backspace-mode  1)               ; make the backspace act as delete
(delete-selection-mode           1)               ; Overwrite selection        ;
(add-hook 'before-save-hook 'whitespace-cleanup)  ; nuke whitespaces when writing to a file


;;============================================================================;;
; Minor Mode                                                                   ;
(setq-default fill-column 80)                     ; ; column marker            ;
(setq fci-always-use-textual-rule t)              ; no image                   ;
(add-hook 'js-mode-hook 'fci-mode)                ;                            ;
(add-hook 'python-mode-hook 'fci-mode)            ;                            ;
                                                                               ;
:(color-theme-initialize)                         ; ; color themes             ;
(setq color-theme-is-global      t)               ; make theme global          ;
(color-theme-dark-laptop)                         ; use dark laptop            ;
;;(color-theme-vim-colors)                        ; or vim                     ;
                                                                               ;
(ido-mode                        t)               ; ; interactively do things  ;
(setq ido-enable-flex-matching   t)               ; insensitive                ;
(add-to-list 'ido-ignore-files "\\.DS_Store")     ;                            ;
                                                                               ;
(autoload                                         ; ; ace-jump mode            ;
  'ace-jump-mode                                  ;                            ;
  "ace-jump-mode"                                 ;                            ;
  "Emacs quick move minor mode"                   ;                            ;
  t)                                              ;                            ;
(define-key global-map (kbd "C-c C-SPC")          ;                            ;
  'ace-jump-mode)                                 ;                            ;
                                                                               ;
(setq yas-snippet-dirs                            ; ; yassnipppes              ;
  '("~/.emacs.d/Extensions/snippets"              ;                            ;
    "~/.emacs.d/Extensions/yasnippet/snippets"))  ;                            ;
(yas/global-mode 1)                               ; make snippets avaliable globally
                                                                               ;
(setq lintnode-jslint-excludes (list              ; ; lintnode                 ;
  'nomen 'undef 'plusplus 'onevar 'white))        ;                            ;
(add-hook 'js-mode-hook                           ;                            ;
  (lambda ()                                      ;                            ;
  (lintnode-hook)))                               ;                            ;
;; (add-hook 'js-mode-hook                        ; explicit running           ;
;;   (lambda ()                                   ;                            ;
;;     (flymake-mode t)))                         ;                            ;
                                                                               ;
(when (load "flymake" t)                          ; ; flymake                  ;
  (defun flymake-pyflakes-init ()                 ;                            ;
  (let* (                                         ;                            ;
    (temp-file                                    ;                            ;
     (flymake-init-create-temp-buffer-copy        ;                            ;
        'flymake-create-temp-inplace))            ;                            ;
    (local-file                                   ;                            ;
      (file-relative-name                         ;                            ;
       temp-file                                  ;                            ;
       (file-name-directory buffer-file-name))))  ;                            ;
    (list "pyflakes" (list local-file))           ; include pyflakes           ;
    (list "pep8" (list local-file))    ))         ; include pep8               ;
  (add-to-list                                    ;                            ;
    'flymake-allowed-file-name-masks              ;                            ;
    '("\\.py\\'" flymake-pyflakes-init)))         ; run for .py scripts        ;
(add-hook 'find-file-hook                         ; hook it up                 ;
  'flymake-find-file-hook)                        ;                            ;
(defun flymake-xml-init ()                        ; fix broken flymake xml init;
  (list "xmllint"                                 ;                            ;
    (list "--valid"                               ;                            ;
      (flymake-init-create-temp-buffer-           ;                            ;
       'flymake-create-temp-inplace))))           ;                            ;
(defun flymake-html-init ()                       ;                            ;
  (let* ((temp-file                               ;                            ;
    (flymake-init-create-temp-buffer-copy         ;                            ;
      'flymake-create-temp-inplace))              ;                            ;
    (local-file                                   ;                            ;
      (file-relative-name temp-file               ;                            ;
        (file-name-directory buffer-file-name)))) ;                            ;
      (list "tidy" (list local-file))))           ;                            ;
(add-to-list                                      ;                            ;
  'flymake-allowed-file-name-masks                ;                            ;
    '("\\.html$" flymake-html-init))              ;                            ;


;;============================================================================;;
; Language Modes                                                               ;
(autoload                                         ; ; csharp-mode              ;
  'csharp-mode                                    ;                            ;
  "csharp-mode"                                   ;                            ;
  "Major mode for editing C# code." t)            ;                            ;
(setq csharp-mode-hook                            ;                            ;
      (function (lambda ()                        ;                            ;
                  (setq indent-tabs-mode nil)     ;                            ;
                  (setq c-indent-level 4))))      ;                            ;
(autoload                                         ; ; powershell               ;
  'powershell                                     ;                            ;
  "powershell"                                    ;                            ;
  "Start a interactive shell of PowerShell." t)   ;                            ;
(add-to-list 'auto-mode-alist '("\\.ps1\\'" .     ;                            ;
                                powershell-mode)) ;                            ;
(add-to-list 'auto-mode-alist '("\\.psm1\\'" .    ;                            ;
                                powershell-mode)) ;                            ;
(autoload                                         ; ; powershell-mode          ;
  'powershell-mode                                ;                            ;
  "powershell-mode"                               ;                            ;
  "Major mode for editing PowerShell code." t)    ;                            ;
(autoload                                         ; ; visual-basic-mode        ;
  'visual-basic-mode                              ;                            ;
  "visual-basic-mode"                             ;                            ;
  "Major mode for editing visual basic." t)       ;                            ;
(autoload                                         ; ; vbscript-mode            ;
  'vbscript-mode                                  ;                            ;
  "vbs-repl"                                      ;                            ;
  "vbs-repl" t)                                   ;                            ;
(setq auto-mode-alist                             ;                            ;
      (append '(("\\.\\(vbs\\|wsf\\)$" .          ;                            ;
                 vbscriptmode))                   ;                            ;
              auto-mode-alist))                   ;                            ;
(autoload                                         ; ; markdown-mode-mode       ;
  'markdown-mode                                  ;                            ;
  "markdown-mode"                                 ;                            ;
  "Major mode for editing Markdown" t)            ;                            ;
(add-to-list 'auto-mode-alist '("\\.md\\'" .      ;                            ;
                                markdown-mode))   ;                            ;


;;============================================================================;;
; Graveyard                                                                    ;
;;(autoload 'pymacs-apply "pymacs")                                            ;
;; (autoload 'pymacs-call "pymacs")                                            ;
;; (autoload 'pymacs-eval "pymacs" nil t)                                      ;
;; (autoload 'pymacs-exec "pymacs" nil t)                                      ;
;; (autoload 'pymacs-load "pymacs" nil t)                                      ;
;; (autoload 'pymacs-autoload "pymacs")                                        ;
;; (pymacs-load "ropemacs" "rope-")                                            ;
;; (eval-after-load "pymacs"                                                   ;
;;   '(add-to-list 'pymacs-load-path "~/.emacs.d/Extensions/Pymacs"))          ;
;;; info path for documentation                                                ;
;;(add-to-list 'Info-default-directory-list "~/.emacs.d/Extensions/info")      ;
;;(add-to-list 'ac-dictionary-directories           ; ; auto complete          ;
;;  "~/.emacs.d/Extensions/auto-complete/dict")     ;                          ;
;;(setq-default ac-sources (add-to-list             ;                          ;
;;  'ac-sources 'ac-source-dictionary))             ;                          ;
;;(global-auto-complete-mode t)                     ; use auto complete dictionary by default
;;(setq ac-auto-start 2)                            ; autocomplete after 2 chars
;;(setq ac-ignore-case nil)                         ; case sensitive auto complete