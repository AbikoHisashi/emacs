;; /site-lisp$B$K%Q%9$r@Z$k(B 

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))
(setq load-path
      (cons (expand-file-name
	     "~/.emacs.d/site-lisp/") load-path))

;; $B%V%m%C%/$NCf$G(BF5$B$r2!$9$H@^$j>v$a$k!#(B
(add-hook 'c-mode-hook'(lambda () (hs-minor-mode 1)))
(define-key global-map (kbd "<f5>") 'hs-toggle-hiding) 

;;com +g $B$G(B gotoLine
(global-set-key "\C-g" 'goto-line)

;; $B5/F0;~$N2hLL$O$$$i$J$$(B
(setq inhibit-startup-message t)
;; $B%a%K%e!<%P!<$r1#$9(B
(tool-bar-mode -1)
;; $B%D!<%k%P!<$r>C$9(B
(tool-bar-mode -1)

;; $B9THV9f$r>o$KI=<($9$k(B
(line-number-mode t) 
(column-number-mode t)
(global-linum-mode t)


;; ;;;;;;;; $BA*BrHO0O$N>pJsI=<((B ;;;;;;;;
;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "[%3d:%4d]"
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;     ""))
;; (add-to-list 'default-mode-line-format
;;              '(:eval (count-lines-and-chars)))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo $B$r(B C +z $B$G$b$G$-$k$h$&$K$9$k(B
(global-set-key "\C-z" 'undo)

;;$B3g8LH4$1KI;_(B
(show-paren-mode)


;;Dabbreev expand $BF~NOJd40(B
(setq-default dabbrev-case-fold-search t)
(global-set-key "\C-l" 'dabbrev-expand)

(setq default-input-method "MacOSX")

;; yatex ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load
;; (setq load-path
;;       (cons (expand-file-name
;; 	     "~/.emacs.d/site-lisp/yatex") load-path))
;; ;; yatex mode
;; (setq auto-mode-alist
;;       (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; 
;; ;; command
;; ;; ;; (setq tex-command "platex"
;; ;; ;;       dvi2-command "xdvi"
;; ;; ;;       dviprint-command-format "dvips %s"
;; ;; ;;       YaTeX-kanji-code 4 ; (1 JIS, 2 SJIS, 3 EUC, 4 UTF-8)
;; ;; ;;       )
;; 
;; ;; yahtml mode
;; (setq auto-mode-alist
;;       (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
;; (autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
;;yatex end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; latex mode
;; (setq auto-mode-alist
;;      (cons (cons "\\.tex$" 'latex-mode) auto-mode-alist))


;; ;; matlab mod
;; (autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
;; (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;; (autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)
;; (setq auto-save-default nil)

(set-face-background 'default "#1C2022")

;;; $B?'J,$1$N@_Dj(B
(global-font-lock-mode t)
(if (>= emacs-major-version 21)
    (setq font-lock-support-mode 'jit-lock-mode)   ;; Just-In-Time$B$JJ8;zAu>~J}<0(B
  (setq font-lock-support-mode 'lazy-lock-mode)  ;; Emacs20$B0JA0$G$O8E$$J}<0(B
  )

(set-face-foreground 'default "white")
;; (set-face-background 'default "black")
;; (setq frame-background-mode 'dark)


;; $B<oN`$4$H$N?'(B
(add-hook 'font-lock-mode-hook
 	  '(lambda ()
 	     (set-face-foreground 'default "white")	     
 	     (set-face-foreground 'font-lock-comment-face "chocolate1")
 	     (set-face-foreground 'font-lock-string-face "LightSalmon")
 	     (set-face-foreground 'font-lock-keyword-face "Cyan1")
 	     (set-face-foreground 'font-lock-builtin-face "LightSteelBlue")
 	     (set-face-foreground 'font-lock-function-name-face "LightSkyBlue")
 	     (set-face-foreground 'font-lock-variable-name-face "LightGoldenrod")
 	     (set-face-foreground 'font-lock-type-face "PaleGreen")
 	     (set-face-foreground 'font-lock-constant-face "Aquamarine")
 	     (set-face-foreground 'font-lock-warning-face "Pink")
 	     )
 	  )

;; $B%?%V(B, $BA43Q%9%Z!<%9(B, $B9TKv6uGrI=<((B
(defface my-face-b-1 '((t (:background "gray10"))) nil) ; $BA43Q%9%Z!<%9(B
(defface my-face-b-2 '((t (:background "gray10"))) nil) ; $B%?%V(B
(defface my-face-u-1 '((t (:background "gray10"))) nil) ; $B9TKv6uGr(B
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

;; web-mode
(require 'web-mode)
;; $B%$%s%G%s%H4X78(B
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
(add-hook 'web-mode-hook 'web-mode-hook)


;;; $BE,MQ$9$k3HD%;R(B
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$"      . web-mode))

(add-to-list 'auto-mode-alist '("\\.m$"         . octave-mode))

;; ;; $B%U%)%s%H$N@_Dj(B
(set-face-attribute 'default nil :family "monaco" :height 140)

;; $B%[!<%`%G%#%l%/%H%j$r=i4|%G%#%l%/%H%j$K$9$k(B
(cd "~/Dropbox")

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (tabbar ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
