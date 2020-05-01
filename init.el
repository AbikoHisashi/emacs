;; /site-lispにパスを切る 

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))
(setq load-path
      (cons (expand-file-name
	     "~/.emacs.d/site-lisp/") load-path))

;; ブロックの中でF5を押すと折り畳める。
(add-hook 'c-mode-hook'(lambda () (hs-minor-mode 1)))
(define-key global-map (kbd "<f5>") 'hs-toggle-hiding) 

;;com +g で gotoLine
(global-set-key "\C-g" 'goto-line)

;; 起動時の画面はいらない
(setq inhibit-startup-message t)
;; メニューバーを隠す
(tool-bar-mode -1)
;; ツールバーを消す
(tool-bar-mode -1)

;; 行番号を常に表示する
(line-number-mode t) 
(column-number-mode t)
(global-linum-mode t)


;; ;;;;;;;; 選択範囲の情報表示 ;;;;;;;;
;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "[%3d:%4d]"
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;     ""))
;; (add-to-list 'default-mode-line-format
;;              '(:eval (count-lines-and-chars)))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo を C +z でもできるようにする
(global-set-key "\C-z" 'undo)

;;括弧抜け防止
(show-paren-mode)


;;Dabbreev expand 入力補完
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

;;; 色分けの設定
(global-font-lock-mode t)
(if (>= emacs-major-version 21)
    (setq font-lock-support-mode 'jit-lock-mode)   ;; Just-In-Timeな文字装飾方式
  (setq font-lock-support-mode 'lazy-lock-mode)  ;; Emacs20以前では古い方式
  )

(set-face-foreground 'default "white")
;; (set-face-background 'default "black")
;; (setq frame-background-mode 'dark)


;; 種類ごとの色
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

;; タブ, 全角スペース, 行末空白表示
(defface my-face-b-1 '((t (:background "gray10"))) nil) ; 全角スペース
(defface my-face-b-2 '((t (:background "gray10"))) nil) ; タブ
(defface my-face-u-1 '((t (:background "gray10"))) nil) ; 行末空白
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

;; web-mode
(require 'web-mode)
;; インデント関係
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


;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html$"      . web-mode))

(add-to-list 'auto-mode-alist '("\\.m$"         . octave-mode))

;; ;; フォントの設定
(set-face-attribute 'default nil :family "monaco" :height 140)

;; ホームディレクトリを初期ディレクトリにする
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
