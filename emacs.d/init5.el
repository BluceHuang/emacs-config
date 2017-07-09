(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
	     '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(setenv "GTAGSLIBPATH" "/Users/huangyong/.gtags/")

(setenv "GTAGSTHROUGH" "")
(package-initialize)

(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message 1)
(setq auto-save-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(setenv "PATH"
		(concat "/usr/local/bin:" (getenv "PATH")))				         
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

;(defun install-packages ()
;  "Install all required packages."
;  (interactive)
;  (unless package-archive-contents
;    (package-refresh-contents))
;  (dolist (package demo-packages)
;    (unless (package-installed-p package)
;      (package-install package))))

;(install-packages)

;(require 'ecb)
;(require 'ecb-autoloads)
(add-to-list 'load-path "~/.emacs.d/custom")
;(add-to-list 'load-path "~/.emacs.d/elpa/helm-20150805.54/")
;(add-to-list 'load-path "~/.emacs.d/elpa/helm-core-20150805.206/")

;(add-to-list 'load-path "~/.emacs.d/elpa/helm-swoop-20140922.1747/")

;(add-to-list 'load-path "~/.emacs.d/elpa/helm-gtags-20150617.1931/")
;(add-to-list 'load-path "~/.emacs.d/elpa/ggtags-20150718.2227/")
;(add-to-list 'load-path "~/.emacs.d/elpa/highlight-indentation-20150307.208/")
;(add-to-list 'load-path "~/.emacs.d/elpa/volatile-highlights-20141004.2240/")

;(add-to-list 'load-path "~/.emacs.d/elpa/company-20141014.1517/")
;(add-to-list 'load-path "~/.emacs.d/elpa/irony-20150716.2230/")
;(add-to-list 'load-path "~/.emacs.d/elpa/clean-aindent-mode-20140615.1532/")

;(add-to-list 'load-path "~/.emacs.d/elpa/google-c-style-20140929.1118/")
;(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20141017.736/")

;(add-to-list 'load-path "~/.emacs.d/elpa/sr-speedbar-20141004.532/")

;(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol-20140923.729/")

;(add-to-list 'load-path "~/.emacs.d/elpa/evil-20141014.1/")

;(add-to-list 'load-path "~/.emacs.d/elpa/function-args-20150604.18/")

;(add-to-list 'load-path "~/.emacs.d/elpa/elpy-20150702.1202/")

;(add-to-list 'load-path "~/.emacs.d/elpa/python-mode-20150709.514/")

;(add-to-list 'load-path "~/.emacs.d/elpa/pyvenv-20150503.941/")
;(add-to-list 'load-path "~/.emacs.d/elpa/jedi-20150623.2335/")
;(add-to-list 'load-path "~/.emacs.d/elpa/jedi-core-20150623.2335/")

;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20140824.1658/")

;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers-20140325.835/")

;(add-to-list 'load-path "~/.emacs.d/elpa/popup-20141002.320/")
;(add-to-list 'load-path "~/.emacs.d/elpa/epc-20140609.2234/")

;(add-to-list 'load-path "~/.emacs.d/elpa/concurrent-20140609.1940/")
;(add-to-list 'load-path "~/.emacs.d/elpa/deferred-20140816.2205/")
;(add-to-list 'load-path "~/.emacs.d/elpa/ctable-20140304.1659/")
;(add-to-list 'load-path "~/.emacs.d/elpa/python-environment-20140321.1116/")
;(add-to-list 'load-path "~/.emacs.d/elpa/ein-20150812.1947/")
;(add-to-list 'load-path "~/.emacs.d/elpa/exec-path-from-shell-20150801.104/")
;(add-to-list 'load-path "~/.emacs.d/elpa/evil-20141014.1/")

;(add-to-list 'load-path "~/.emacs.d/elpa/company-jedi-20150623.2344/")
;(add-to-list 'load-path "~/.emacs.d/elpa/smex-20140425.1314/")
;(add-to-list 'load-path "~/.emacs.d/elpa/sml-mode-6.5/")
;(add-to-list 'load-path "~/.emacs.d/elpa/flycheck-20150725.1346/")
;(add-to-list 'load-path "~/.emacs.d/elpa/flycheck-irony-20150308.1230/")
;(add-to-list 'load-path (expand-file-name  "~/.emacs.d/elpa/smex"))
(require 'ido)
(ido-mode t)

(global-linum-mode 1)
;(require 'hlinum)
;(hlinum-activate)
(auto-save-mode nil)

(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'setup-ggtags)
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
(require 'cc-mode)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(delete 'company-gtags company-backends)
;(delete 'company-clang company-backends)
(delete 'company-ropemacs company-backends)
;(define-key c-mode-map [(tab)] 'company-gtags)
;(define-key c++-mode-map [(tab)] 'company-gtags)
(setq-local imenu-create-index-function 'ggtags-build-imenu-index)
;(setq company-idle-delay t)
;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)
;(company-gtags)
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
(setq-local imenu-create-index-function 'ggtags-build-imenu-index)
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


;(add-to-list 'load-path "~/.emacs.d/elpa/google-c-style-20140929.1118")
(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-c-style)
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
;(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files nil)
(setq sr-speedbar-width 11)
;(setq speedbar-use-images nil)
(global-set-key (kbd "M-g") 'goto-line)
;(set-default-font "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(tool-bar-mode nil)
(setq x-select-enable-clipboard t)
(setq column-number-mode t)

;(global-set-key [(f2)] 'helm-gtags-find-files)
(global-set-key [(f4)] 'helm-gtags-dwim)
(global-set-key [(f5)] 'helm-gtags-pop-stack)
(global-set-key [(f2)] 'helm-gtags-select)
(global-set-key [(f6)] 'helm-gtags-select-path)

(require 'ggtags)
(add-hook 'c-mode-common-hook
		(lambda ()
			(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
				(ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

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

;(setq emms-info-mp3info-coding-system 'gbk
;	  emms-cache-file-coding-system 'utf-8     
;      emms-i18n-default-coding-system '(utf-8 . utf-8)
;)     
;(set-language-environment "Chinese-GB")
;(set-buffer-file-coding-system 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(set-selection-coding-system 'utf-8)
;(set-default-coding-systems 'utf-8)
;(set-clipboard-coding-system 'utf-8)  
;(setq ansi-color-for-comint-mode t)
;(modify-coding-system-alist 'process "*" 'utf-8)  
;(setq-default pathname-coding-system 'utf-8)  
;(prefer-coding-system 'utf-8)
;(setq default-process-coding-system '(utf-8 . utf-8))  
;(setq locale-coding-system 'utf-8)
;(setq file-name-coding-system 'utf-8) 
;(setq default-buffer-file-coding-system 'utf-8) 
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

;?; 当光标在行尾上下移动的时候，始终保持在行尾。 
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
 '(column-number-mode t)
 '(company-minimum-prefix-length 0)
 '(display-time-mode t)
 '(eldoc-in-minibuffer-mode t)
 '(elpy-eldoc-show-current-function t)
 '(elpy-mode-hook (quote (subword-mode hl-line-mode)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-sane-defaults)))
 '(exec-path
   (quote
    ("usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin")))
 '(flycheck-json-jsonlint-executable "/usr/local/bin/jsonlint")
 '(global-semantic-idle-scheduler-mode nil)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(menu-bar-mode nil)
 '(safe-local-variable-values (quote ((mangle-whitespace . t))))
 '(scroll-bar-mode nil)
 '(semantic-default-submodes
   (quote
    (global-semantic-highlight-func-mode global-semantic-stickyfunc-mode global-semanticdb-minor-mode)))
 '(show-paren-mode t)
 '(tabbar-ruler-popup-menu t)
 '(tabbar-ruler-popup-toolbar t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq auto-mode-alist
	  (cons '("\\\.cc$" . c++-mode)
			 auto-mode-alist))
(add-to-list 'auto-mode-alist  '("\\\.cpp$" . c++-mode))
(add-to-list 'auto-mode-alist  '("\\\.h$" . c++-mode))

;(add-to-list 'load-path "~/.emacs.d/")
(require 'unicad)
(unicad-enable)

;(setq emms-info-mp3info-coding-system 'gbk
;	  emms-cache-file-coding-system 'utf-8
;	  emms-i18n-default-coding-system '(utf-8 . utf-8)
;)
;(setq command-line-default-directory "/usr/local/app")
;(cd "~/games/douniuexample/"
(sr-speedbar-open)
;(fullscreen-mode-fullscreen-toggle)
(require 'function-args)
(fa-config-default)
;(set-default 'semantic-case-fold t)
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))
;  (global-set-key [mouse-1] '(lambda ()
;							   (interactive)
;							   (mouse-set-point 1))))

;(require 'semantic)
;(global-semanticdb-minor-mode 1)
;(global-semantic-idle-scheduler-mode 1)
;(semantic-mode t)
;(add-to-list 'load-path "~/.emacs.d/elpa/function-args-20150604.18/")
;(require 'function-args)
;(fa-config-default)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(require 'tramp)
(setq tramp-default-method "ssh")
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
(setq visible-bell t)
(require 'evil)
;(evil-mode 1)
(which-function-mode 1)
(global-set-key [S-f3] 'find-grep)
(setq grep-find-command 
            "find . -type f -name \"*.h\" -o -name \"*.cc\" | xargs grep -nH -e ")
(require 'irony)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

    ;;replace the `completion-at-point' and `complete-symbol' bindings in
    ;;     ;; irony-mode's buffers by irony-mode's asynchronous function-args
(defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

;; Only needed on windows-nt
(eval-after-load 'company
      '(add-to-list 'company-backends 'company-irony))
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-hook 'after-init-hook 'global-flycheck-mode)
;(eval-after-load 'flycheck
;				       '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;(semantic-mode nil)
;(global-semanticdb-minor-mode nil)

(semantic-add-system-include "/usr/local/include")
;(setq jedi:server-command '("~/.emacs.d/elpa/jedi-core-20150623.2335/jediepcserver.py"))
(require 'python)
(require 'elpy)
(add-hook 'python-mode-hook 'elpy-mode)
(when (require 'elpy nil t)
  (elpy-enable))
(require 'jedi)
(require 'company-jedi)
(defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;(when (executable-find "ipython")
;    (setq python-shell-interpreter "/usr/local/bin/ipython"))
;(require 'elpy)

;(setq elpy-default-minor-modes
;          (remove 'flymake-mode
;                  elpy-default-minor-modes))
;(require 'ipython)
(setq
 python-shell-interpreter "/usr/local/bin/ipython"
 python-shell-interpreter-args "--colors=Linux --pylab --profile=default --gui=osx"
 ;python-shell-interpreter-args "--colors=Linux --profile=default --gui=osx")
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
(require 'ein)
;(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
(when (memq window-system '(mac ns))
      (exec-path-from-shell-initialize))
;(setq elpy-rpc-backend "jedi")
(require 'tabbar)
;; Tabbar settings
(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;(tabbar-mode 1)

(setq tabbar-buffer-list-function
    (lambda ()
        (remove-if
          (lambda(buffer)
             (find (aref (buffer-name buffer) 0) " *"))
          (buffer-list))))
(setq tabbar-buffer-groups-function
      (lambda()(list "All")))

;;set tabbar's backgroud color
;(set-face-attribute 'tabbar-default nil
;                    :background "gray"
;                    :foreground "gray30")
;(set-face-attribute 'tabbar-selected nil
;                    :inherit 'tabbar-default
;                    :background "green"
;                    :box '(:line-width 3 :color "DarkGoldenrod") )
;(set-face-attribute 'tabbar-unselected nil
;                    :inherit 'tabbar-default
;                    :box '(:line-width 3 :color "gray"))

;; USEFUL: set tabbar's separator gap
;(custom-set-variables '(tabbar-separator (quote (1.5))))
;
(require 'electric)
(electric-pair-mode t)
(electric-indent-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ENCODING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C-h C RET
;; M-x describe-current-coding-system

(add-to-list 'file-coding-system-alist '("\\.tex" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.txt" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.el" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.scratch" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("user_prefs" . utf-8-unix) )

(add-to-list 'process-coding-system-alist '("\\.txt" . utf-8-unix) )

(add-to-list 'network-coding-system-alist '("\\.txt" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.h" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.cpp" . utf-8-unix) )
(add-to-list 'file-coding-system-alist '("\\.cc" . utf-8-unix) )

(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; mnemonic for utf-8 is "U", which is defined in the mule.el
(setq eol-mnemonic-dos ":CRLF")
(setq eol-mnemonic-mac ":CR")
(setq eol-mnemonic-undecided ":?")
(setq eol-mnemonic-unix ":LF")

(defalias 'read-buffer-file-coding-system 'lawlist-read-buffer-file-coding-system)
(defun lawlist-read-buffer-file-coding-system ()
  (let* ((bcss (find-coding-systems-region (point-min) (point-max)))
         (css-table
          (unless (equal bcss '(undecided))
            (append '("dos" "unix" "mac")
                    (delq nil (mapcar (lambda (cs)
                                        (if (memq (coding-system-base cs) bcss)
                                            (symbol-name cs)))
                                      coding-system-list)))))
         (combined-table
          (if css-table
              (completion-table-in-turn css-table coding-system-alist)
            coding-system-alist))
         (auto-cs
          (unless find-file-literally
            (save-excursion
              (save-restriction
                (widen)
                (goto-char (point-min))
                (funcall set-auto-coding-function
                         (or buffer-file-name "") (buffer-size))))))
         (preferred 'utf-8-unix)
         (default 'utf-8-unix)
         (completion-ignore-case t)
         (completion-pcm--delim-wild-regex ; Let "u8" complete to "utf-8".
          (concat completion-pcm--delim-wild-regex
                  "\\|\\([[:alpha:]]\\)[[:digit:]]"))
         (cs (completing-read
              (format "Coding system for saving file (default %s): " default)
              combined-table
              nil t nil 'coding-system-history
              (if default (symbol-name default)))))
    (unless (zerop (length cs)) (intern cs))))
(setq irony-additional-clang-options (quote ("-std=c++11" "-stdlib=libc++")))
