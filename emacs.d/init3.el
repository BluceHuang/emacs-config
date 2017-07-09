(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq inhibit-startup-message t)
(setq auto-save-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(defconst demo-packages
  '(anzu
    company
    ggtags
    helm
    helm-gtags
    helm-swoop
    function-args
    clean-aindent-mode
    comment-dwim-2
    iedit
    yasnippet
    smartparens
    sml-mode
    projectile
    volatile-highlights
    undo-tree))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;(require 'ecb)
;(require 'ecb-autoloads)
(global-linum-mode 1)
(require 'hlinum)
(hlinum-activate)
(auto-save-mode nil)
(add-to-list 'load-path "~/.emacs.d/custom")

(add-to-list 'load-path (expand-file-name  "~/.emacs.d/elpa/smex"))
(require 'ido)
(ido-mode t)

(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;;(require 'setup-cedet)
;;(require 'setup-editing)

(require 'volatile-highlights)
(volatile-highlights-mode t)
;(windmove-default-keybindings)

;; function-args
;(require 'function-args)
;(fa-config-default)
;(define-key c-mode-map  [(tab)] 'moo-complete)
;(define-key c++-mode-map  [(tab)] 'moo-complete)

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;(delete 'company-semantic company-backends)
;(define-key c-mode-map  [(control tab)] 'company-complete)
;(define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;(define-key helm-gtags-mode-map (kbd "F7")  'helm-gtags-find-tag)
;(define-key helm-gtags-mode-map (kbd "F6")  'helm-gtags-find-files)
;(define-key helm-gtags-mode-map (kbd "F5") 'helm-gtags-select)
;(define-key helm-gtags-mode-map (kbd "F3") 'helm-gtags-dwim)
;(define-key helm-gtags-mode-map (kbd "F4") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)
;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq
 c-default-style "stroustrup"
 c-basic-offset 4;; set style to "linux"
)

;(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

(setq-default c-basic-offset 4)
;; Compilation
;(global-set-key (kbd "<f5>") (lambda ()
;                              (interactive)
;                               (setq-local compilation-read-command nil)
;                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
;(require 'dtrt-indent)
;(dtrt-indent-mode 1)

;; Package: ws-butler

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Package: smartparens
;(require 'smartparens-config)
;(setq sp-base-key-bindings 'paredit)
;(setq sp-autoskip-closing-pair 'always)
;(setq sp-hybrid-kill-entire-symbol nil)
;(sp-use-paredit-bindings)

;(show-smartparens-global-mode +1)
;(smartparens-global-mode 1)


(add-to-list 'load-path "~/.emacs.d/elpa/google-c-style-20140929.1118")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;(setq-default c-indent-tabs-mode nil
;			  c-indent-level 0
;			  c-argdecl-indent 0
;			  c-tab-always-indent nil
;			  backward-delete-function nil)
;(c-add-style "my-c-style" '((c-continued-statement-offset 4)))
;(defun my-c-mode-hook()
;  (c-set-style "my-c-style")
;  (c-set-offset 'substatement-open 0)
;  (c-set-offset 'inline-open '+)
;  (c-set-offset 'block-open '+)
;  (c-set-offset 'brace-list-open '+)
;  (c-set-offset 'case-lable '+))
;(add-hook 'c-mode-hook 'my-c-mode-hook)
;(add-hook 'c++-mode-hook 'my-c-mode-hook)
;(setq-default c-indent-tabs-mode nil
;			  c-tab-always-indent nil)


                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files nil)
(setq sr-speedbar-width 30)
;(setq speedbar-use-images nil)
(global-set-key (kbd "M-g") 'goto-line)
(set-default-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(tool-bar-mode nil)
(setq x-select-enable-clipboard t)
(setq column-number-mode t)

(global-set-key [(f2)] 'helm-gtags-find-files)
(global-set-key [(f4)] 'helm-gtags-dwim)
(global-set-key [(f5)] 'helm-gtags-pop-stack)
;(global-set-key [(f6)] 'helm-gtags-select)
(global-set-key [(f6)] 'helm-gtags-select-path)
(require 'highlight-symbol)
(global-set-key [(f3)] 'highlight-symbol-at-point)
;(global-set-key [(shiftf3)] 'highlight-symbol-next)
;(global-set-key [(meta f3)] 'highlight-symbol-prev)
;(global-set-key [(alt f3)] 'highlight-symbol-query-replace)
;

;;没有提示音，也不闪屏
(setq ring-bell-function 'ignore)

;;去掉警告铃声
(setq visible-bell nil)

;; 显示时间，格式如下
(display-time-mode 1)  
(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)  

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 在标题栏提示你目前在什么位置

;; 默认显示 80列就换行
(setq default-fill-column 80)

;;不要临时文件
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t);;不产生备份

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(setq emms-info-mp3info-coding-system 'gbk
	  emms-cache-file-coding-system 'utf-8     
      emms-i18n-default-coding-system '(utf-8 . utf-8)
)     
(set-language-environment "Chinese-GB")
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)  
(setq ansi-color-for-comint-mode t)
(modify-coding-system-alist 'process "*" 'utf-8)  
(setq-default pathname-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))  
(setq locale-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8) 
(setq default-buffer-file-coding-system 'utf-8) 
;(set-background-color "Black") 
;(set-foreground-color "White")
;(set-language-environment 'Chinese-GB)
;(set-keyboard-coding-system 'euc-cn)
;(set-clipboard-coding-system 'euc-cn)                             
;(set-terminal-coding-system 'euc-cn)
;(set-buffer-file-coding-system 'euc-cn)
;(set-selection-coding-system 'euc-cn)
;(modify-coding-system-alist 'process "*" 'euc-cn)
;(setq default-process-coding-system '(euc-cn . euc-cn))
;(setq-default pathname-coding-system 'euc-cn)`
;; 显示括号匹配
(show-paren-mode nil)
(setq show-paren-style 'parentheses)

;; 当光标在行尾上下移动的时候，始终保持在行尾。 
(setq track-eol t)

;;按回车键后下一行代码自动缩进

(put 'upcase-region 'disabled nil)

(defun indent-buffer ()
"Indent the whole buffer."
(interactive)
(save-excursion
(indent-region (point-min) (point-max) nil)))

(global-set-key [(f7)] 'indent-buffer)

;(require 'cflow-mode)
;(defvar cmd nil nil)
;(defvar cflow-buf nil nil)
;(defvar cflow-buf-name nil nil)

;(defun yyc/cflow-function (function-name)
;  "Get call graph of inputed function. "
;  (interactive "sFunction name:\n")
;  ;(interactive (list (car (senator-jump-interactive "Function name: "
;  ;                                                  nil nil nil))))
;  (setq cmd (format "cflow  -b --main=%s %s" function-name buffer-file-name))
;  (setq cflow-buf-name (format "**cflow-%s:%s**"
;                               (file-name-nondirectory buffer-file-name)
;                               function-name))
;  (setq cflow-buf (get-buffer-create cflow-buf-name))
;  (set-buffer cflow-buf)
;  (setq buffer-read-only nil)
;  (erase-buffer)
;  (insert (shell-command-to-string cmd))
;  (pop-to-buffer cflow-buf)
;  (goto-char (point-min))
;  (cflow-mode)
;)
(put 'narrow-to-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-deep-blue)
;(color-theme-classic)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq auto-mode-alist
	  (cons '("\\\.cc$" . c++-mode)
			 auto-mode-alist))
;(add-to-list 'load-path "~/.emacs.d/")
;(require 'unicad)
;(unicad-enable)

;(setq emms-info-mp3info-coding-system 'gbk
;	  emms-cache-file-coding-system 'utf-8
;	  emms-i18n-default-coding-system '(utf-8 . utf-8)
;)

