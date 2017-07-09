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
    duplicate-thing
    ggtags
    helm
    helm-gtags
    helm-swoop
    function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
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
;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")
(auto-save-mode nil)
(add-to-list 'load-path "~/.emacs.d/custom")

;(add-to-list 'load-path (expand-file-name  "~/.emacs.d/elpa/smex"))
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
;(require 'ws-butler)
;(add-hook 'prog-mode-hook 'ws-butler-mode)

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

;; Package: projejctile
;(require 'projectile)
;(projectile-global-mode)
;(setq projectile-enable-caching t)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-width 4))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )

;Create MyCppStyle
;(defconst MyCppStyle
;'((c-tab-always-indent . t)
;    (c-comment-only-line-offset . 0)
;        (c-hanging-braces-alist . ((substatement-open after)
;                                              (brace-list-open)))
;        (c-cleanup-list . (comment-close-slash
;                                 compact-empty-funcall))
;    (c-offsets-alist . ((substatement-open . 0)
;                                                (innamespace . 0)                           ;;在namespace中不缩进
;                                                (case-label      . +)                          ;;case标签缩进一个c-basic-offset单位
;                                                (access-label . -)                             ;;private/public等标签少缩进一单位
;                                                (inline-open . 0)                             ;;在.h文件中写函数，括号不缩进
;                                                (block-open     . 0)))                       ;;在一个新块开始时不缩进
;;    (c-echo-syntactic-information-p t)
;        (setq comment-start "/*"
;                  comment-end "*/")
;    (setq indent-tabs-mode nil))
;    "My Cpp Coding Style")
;(c-add-style "MyCppStyle" MyCppStyle)                   ;;定义完自己的style，将其添加到cc-mode的style中。
;;Define own hook
;(defun MyCppHook ()
;(company-mode)
;(setq indent-tabs-mode nil)
;(setq global-hl-line-mode t)
;(c-set-style "MyCppStyle"))                                   ;;设置这个hook对应于MyCppStyle
;(add-hook 'c++-mode-hook 'MyCppHook)                ;;将此hook应用于所有的c++模式。
;;set *.h and *.c and *.cpp files use c++ mode
;(setq auto-mode-alist
;      (cons '("" . c++-mode) auto-mode-alist))
;(setq auto-mode-alist
;      (cons '("" . c++-mode) auto-mode-alist))
;(setq auto-mode-alist
;      (cons '("" . c++-mode) auto-mode-alist))

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


;(require 'smex) ; Not needed if you use package.el
;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "M-g") 'goto-line)

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
;(require 'python)
;(require 'pymacs)
;(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;(autoload 'python-mode "python-mode" "Python editing mode." t)
;(setq interpreter-mode-alist(cons '("python" . python-mode)
;                           interpreter-mode-alist))
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(autoload 'python-mode "python-mode" "Python Mode." t)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;(require 'pycomplete)
;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)

(require 'tabbar)
(tabbar-mode)
(define-prefix-command 'lwindow-map)
(global-set-key (kbd "<shift-up>") 'tabbar-backward-group)
(global-set-key (kbd "<shift-down>") 'tabbar-forward-group)
(global-set-key [(f8)] 'tabbar-backward)
(global-set-key [(f9)] 'switch-window)

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
(setq frame-title-format "emacs@%b")

;; 默认显示 80列就换行
(setq default-fill-column 80)

;;不要临时文件
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t);;不产生备份

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;(tool-bar-mode -1)
;(menu-bar-mode -1)
;(scroll-bar-mode nil)
(transient-mark-mode t)
;(set-scroll-bar-mode nil)

(set-language-environment "UTF-8")
(set-background-color "Black") 
(set-foreground-color "White")

;; 显示括号匹配
(show-paren-mode nil)
(setq show-paren-style 'parentheses)

;; 当光标在行尾上下移动的时候，始终保持在行尾。 
(setq track-eol t)

;;按回车键后下一行代码自动缩进
(global-set-key [return] 'newline-and-indent) 

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
