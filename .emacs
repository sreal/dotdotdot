;; SYSTEM Specific
(if (string= system-type "darwin")
    (progn
      (add-to-list 'exec-path "/Library/Frameworks/Python.framework/Versions/2.7/bin/")
      (add-to-list 'exec-path "/usr/local/bin/")
      (setq default-directory "/Users/simoneames/projects/current")) )

(if (string= system-type "linux")
    (progn
      (setq default-directory "~/projects")) )

(if (string= system-type "MIGW32_NT-6.2")
    (progn
      (add-to-list 'exec-path "C:\\python273")
      (add-to-list 'exec-path "C:\\python273\\Scripts")
      (setq default-directory "C:\\projects\\current\\")) )

(if (string= system-type "windows-nt")
    (progn
      (add-to-list 'exec-path "C:\\python273")
      (add-to-list 'exec-path "C:\\python273\\Scripts")
      (add-to-list 'exec-path "C:\\applications\\bin")
      (add-to-list 'exec-path "C:\\applications\\Heroku\\ruby-1.9.2\\bin")
      (add-to-list 'exec-path "C:\\applications\\Heroku\\bin")
      (add-to-list 'exec-path "C:\\applications\\miktex-portable\\miktex\\bin")
      (setq default-directory "C:\\Users\\Simon\\projects\\current")
      ))

;;============================================================================
;; load paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/Extensions/")
(add-to-list 'load-path "~/.emacs.d/Extensions/themes/")
(add-to-list 'load-path "~/.emacs.d/Extensions/yasnippet")

;;============================================================================
;; Package Manager Hook & Installs
(when (>= emacs-major-version 24)
  (require 'package)
  ;; (add-to-list
  ;;  'package-archives
  ;;  '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list
   'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize))


;; Let's use CYGWIN bash
;; needs to be repaired for *nix and osx
(setq binary-process-input t)
(setq w32-quote-process-args ?\")
(setq shell-file-name "bash") ;; or sh if you rename your bash executable to sh.
(setenv "SHELL" shell-file-name)
(setq explicit-shell-file-name shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

;; themes
(require 'color-theme)
(color-theme-initialize)                        ; ; color themes
(setq color-theme-is-global      t)             ; make theme global
;;(color-theme-dark-laptop)                     ; use dark laptop
(color-theme-vim-colors)                        ; or vim
;; (load-theme 'tronesque)
;; (tronesque-mode-line)
;; (load-theme 'subatomic)
;; (load-theme 'clues)
;; (load-theme 'leuven)

;; jslint
;; this should be a variable
(setq jshint-configuration-path "C:\\Users\\Simon\\.jshintoptions.json")
(require 'flymake-jshint)
(add-hook 'js-mode-hook 'flymake-jshint-load)

;; puppet-lint
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(require 'flymake-puppet)
(add-hook 'puppet-mode-hook (lambda () (flymake-puppet-load)))

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-+") 'er/contract-region)

;; change-inner
(require 'change-inner)
(global-set-key (kbd "M-=") 'change-inner)
(global-set-key (kbd "M-+") 'change-outer)

; ispell to use aspell
(setq ispell-program-name "aspell")
;;(require 'ispell)

;;sr-speedbar
(require 'sr-speedbar)
(global-set-key (kbd "C-|") 'sr-speedbar-toggle)


;;===========================================================================
;; Generic Bindings (graphical only further down)
(global-set-key "\C-w"     'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key [mouse-2]  'clipboard-yank)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


(setq inhibit-startup-message    t)               ; Don't want any startup message
(setq inhibit-splash-screen      t)               ; Or Start screen
(menu-bar-mode                   0)              ; Or menu
(tool-bar-mode                   0)             ; Or toolbar
(setq auto-save-list-file-name   nil)             ; Don't want any .saves files
(setq vc-follow-symlinks         t)               ; sym links
(setq backup-directory-alist                      ; backup directory ~.saves
      `(("." . "~/.saves")))                      ;
(global-auto-revert-mode         1)               ; Automatically revert files
(setq temporary-file-directory   "~/.tmp/")       ; Save flymake to tmp dir
(setq backup-directory-alist                      ; Save all to temporary dir
 `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
 `((".*" ,temporary-file-directory t)))

(setq search-highlight           t)               ; Highlight search object
(setq query-replace-highlight    t)               ; Highlight query object
(setq mouse-sel-retain-highlight t)               ; Keep mouse high-lightening
(setq c-default-style "bsd")                      ; bsd style
(setq-default truncate-lines     t)               ; Set long lines
(setq initial-scratch-message    nil)             ; Clear scratch message

(setq-default indent-tabs-mode   nil)             ; spaces instead of tabs
(setq indent-line-function 'insert-tab)           ; indent instead of moving forward
(setq-default tab-width 2)                        ; default 2 spaces for tabs
(setq js-indent-level 2)                          ; 2 space javascript indent
(add-hook                                         ; 4 space python indent
 'python-mode-hook
 (function
  (lambda ()
    (setq indent-tabs-mode nil
          tab-width 4))))
(setq line-number-mode           t)               ; Line number
(setq column-number-mode         t)               ; Column number
(setq visible-bell               t)               ; Turn off the visible bell
(setq ring-bell-function         'ignore)         ; Ignore the bell completely
(setq debug-on-error             0)               ; Don't enter debugger on error
(subword-mode                    1)               ; CamelCase
(global-subword-mode             1)               ; Subword Jumping
(delete-selection-mode           1)               ; Overwrite selection
(add-hook 'before-save-hook 'whitespace-cleanup)  ; nuke whitespaces when writing to a file

;;============================================================================
;; Requires
(require 'ido)
(require 'yasnippet)
(require 'rainbow-delimiters)
(require 'flymake-cursor)
(require 'powershell-mode)
(require 'lorem-ipsum)
;; (require 'fill-column-indicator)

;;============================================================================
;; Blog Mode
;;org-html-head
(setq org-export-default-language "en"
      org-export-html-extension "html"
      org-export-highlight-first-table-line t
      org-html-head-include-default-style nil
      org-html-head "")
(setq org-publish-project-alist                   ; ; org-mode blog publishing
'(
("blog"
   :base-directory "~/DropBox/org-mode/"
   :base-extension "org"
   :html-extension "html"
   :html-head "<link rel=\"stylesheet\" title=\"Standard\" href=\"css/style.css\" type=\"text/css\" />"
   :html-postamble nil
   :html-preamble "
<div id=\"menu\">
 <p>
 <a href=\"index.html\" >Home</a> |
 <a href=\"eventsage.html\" >eventsage</a> |
 <a href=\"game.html\" >game</a> |
 <a href=\"life.html\" >life</a> |
 <a href=\"todo.html\" >todo</a>
 </p>
</div>"
   :htmlized-source t
   :table-of-contents 2
   :publishing-directory "~/projects/blog/www/"
   :publishing-function org-html-publish-to-html
   )
("resume-content"
   :base-directory "~/DropBox/org-mode/resume"
   :base-extension "org"
   :html-extension "html"
   :html-head "
<link rel=\"stylesheet\" title=\"Standard\" href=\"css/bootstrap.min.css\" type=\"text/css\" />
<link rel=\"stylesheet\" title=\"Standard\" href=\"css/org.css\" type=\"text/css\" />
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-51981407-1', 'sreal.github.io');
  ga('send', 'pageview');
</script>
"
   :html-postamble nil
   :publishing-directory "~/projects/resume/"
   :publishing-function org-html-publish-to-html
   )
("resume-static"
   :base-directory "~/DropBox/org-mode/resume/static"
   :base-extension "css\\|js"
   :recursive t
   :publishing-directory "~/projects/resume/"
   :publishing-function org-publish-attachment
  )
("resume"
   :components ("resume-static" "resume-content"))
))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . org-mode))

;;============================================================================
;; Minor Mode
(ido-mode                        t)               ; ; interactively do things
;; (setq ido-enable-flex-matching   t)               ; insensitive
;; (add-to-list 'ido-ignore-files "\\.DS_Store")

;;(setq-default fill-column 80)                     ; ; column marker
;;(setq fci-always-use-textual-rule t)              ; no image
;(add-hook 'js-mode-hook 'fci-mode)                ; js hook
;(add-hook 'python-mode-hook 'fci-mode)            ; python hook


(autoload                                         ; ; ace-jump mode
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode" t)
(define-key global-map
  (kbd "C-c C-SPC") 'ace-jump-mode)

(setq
 yas-snippet-dirs                                 ; ; yassnipppets
 '("~/.emacs.d/Extensions/snippets"
   "~/.emacs.d/Extensions/yasnippet/snippets"))
(yas/global-mode 1)                               ; make snippets avaliable globally

(global-rainbow-delimiters-mode)                  ; ; rainbow mode

(setq py-python-command "C:\\Python27\\")


;;============================================================================
;; Custom Functions

;; pretty prints the selection on a json document
(defun pretty-print-json(&optional b e)
  (interactive "r")
  (shell-command-on-region b e "python -m json.tool" (current-buffer) t))

;; increment decimal at point
(defun my-increment-number-decimal (&optional arg)
  "Increment the number forward from point by 'arg'."
  (interactive "p*")
  (save-excursion
    (save-match-data
      (let (inc-by field-width answer)
        (setq inc-by (if arg arg 1))
        (skip-chars-backward "0123456789")
        (when (re-search-forward "[0-9]+" nil t)
          (setq field-width (- (match-end 0) (match-beginning 0)))
          (setq answer (+ (string-to-number (match-string 0) 10) inc-by))
          (when (< answer 0)
            (setq answer (+ (expt 10 field-width) answer)))
          (replace-match (format (concat "%0" (int-to-string field-width) "d")
                                 answer)))))))
(defun my-decrement-number-decimal (&optional arg)
  (interactive "p*")
  (my-increment-number-decimal (if arg (- arg) -1)))
(global-set-key (kbd "C-c +") 'my-increment-number-decimal)
(global-set-key (kbd "C-c -") 'my-decrment-number-decimal)


;;============================================================================
;; Plugin and Function Repairs

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(flymake-errline ((((class color)) (:background "lavender" :foreground "black"))))
;;  '(flymake-warnline ((((class color)) (:background "lavender" :foreground "black")))))

(defun flymake-create-temp-inplace (file-name prefix)
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((name (concat
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" prefix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file name nil ext))
         )
    temp-name))

(when (load "flymake" t)                          ; ; flymake
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "lintrunner.bat" (list local-file))             ; include all
      ))
  (add-to-list
   'flymake-allowed-file-name-masks
   '("\\.py\\'" flymake-pylint-init)))             ; run for .py scripts
(add-hook 'find-file-hook                          ; hook it up
  'flymake-find-file-hook)

(defun flymake-xml-init ()                         ; fix broken flymake xml init
  (list "xmllint"
    (list "--valid"
      (flymake-init-create-temp-buffer-copy
       'flymake-create-temp-inplace))))

;;------------------------------------------------------------------------------
;; Graphical Only
;;------------------------------------------------------------------------------
(if (display-graphic-p)
    (progn

      (message "LOADING GRAPHIC STUFF")
      ;;============================================================================
      ;; load paths
      ;; (add-to-list 'load-path "~/.emacs.d/Extensions/python-mode")


      ;;============================================================================
      ;; Requires

      ;;============================================================================
      ;; Graphic Bindings
      (normal-erase-is-backspace-mode  1)               ; make the backspace act as delete

      ;; FONT SELECTION
      ;; (set-default-font "monofur-12")                  ; monofur custom font, small
      ;; (set-default-font "monofur-19")                  ; monofur custom font, big
      ;; (set-default-font "Consolas-9")                  ; Consolas alternate
      ;; (set-default-font "Inconsolata-12")              ; Inconsolas alternate
      ;; (set-default-font "Courier New-12")              ; Courier alternate
      ;; (print (font-family-list))

      (grep-compute-defaults)
      (grep-apply-setting 'grep-find-command "grep -nHri
  ~/projects/current/ewb/src
-e ")


      ;;============================================================================
      ;; Minor Mode


      ;;============================================================================
      ;; Language Modes
      (autoload                                         ; ; csharp-mode
        'csharp-mode
        "csharp-mode"
        "Major mode for editing C# code." t)
      (setq csharp-mode-hook
            (function (lambda ()
                        (setq indent-tabs-mode nil)
                        (setq c-indent-level 4))))
      (autoload                                         ; ; powershell
        'powershell
        "powershell"
        "Start a interactive shell of PowerShell." t)
      (add-to-list
       'auto-mode-alist
       '("\\.ps1\\'" .
         powershell-mode))
      (add-to-list
       'auto-mode-alist
       '("\\.psm1\\'" .
         powershell-mode))
      (autoload                                         ; ; powershell-mode
        'powershell-mode
        "powershell-mode"
        "Major mode for editing PowerShell code." t)
      (autoload                                         ; ; visual-basic-mode
        'visual-basic-mode
        "visual-basic-mode"
        "Major mode for editing visual basic." t)
      (autoload                                         ; ; vbscript-mode
        'vbscript-mode
        "vbs-repl"
        "vbs-repl" t)
      (setq auto-mode-alist
            (append '(("\\.\\(vbs\\|wsf\\)$" .
                       vbscriptmode))
                    auto-mode-alist))
      (autoload                                         ; ; markdown-mode-mode
        'markdown-mode
        "markdown-mode"
        "Major mode for editing Markdown" t)
      (add-to-list
       'auto-mode-alist
       '("\\.md\\'" .
         markdown-mode))


      ;;============================================================================
                                        ; Graveyard
      ;; (autoload 'pymacs-apply "pymacs")
      ;; (autoload 'pymacs-call "pymacs")
      ;; (autoload 'pymacs-eval "pymacs" nil t)
      ;; (autoload 'pymacs-exec "pymacs" nil t)
      ;; (autoload 'pymacs-load "pymacs" nil t)
      ;; (autoload 'pymacs-autoload "pymacs")
      ;; (pymacs-load "ropemacs" "rope-")
      ;; (eval-after-load "pymacs"
      ;;   '(add-to-list 'pymacs-load-path "~/.emacs.d/Extensions/Pymacs"))

      ;;; info path for documentation
      ;;(add-to-list 'Info-default-directory-list "~/.emacs.d/Extensions/info")

      ;;(add-to-list 'ac-dictionary-directories           ; ; auto complete
      ;;  "~/.emacs.d/Extensions/auto-complete/dict")
      ;;(setq-default ac-sources (add-to-list
      ;;  'ac-sources 'ac-source-dictionary))
      ;;(global-auto-complete-mode t)                     ; use auto complete dictionary by default
      ;;(setq ac-auto-start 2)                            ; autocomplete after 2 chars
      ;;(setq ac-ignore-case nil)                         ; case sensitive auto complete

      ;;smooth-scrolling
      ;;http://www.emacswiki.org/cgi-bin/wiki/SmoothScrolling
      ;; (require 'smooth-scrolling)
      ;; (setq scroll-step 1)
      ;; (setq scroll-conservatively 10000)
      ;; (setq auto-window-vscroll nil)

      ) ; progn
  ) ; display-graphic-p
