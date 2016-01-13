;;
;; verilog mode
(defun prepend-path ( my-path )
(setq load-path (cons (expand-file-name my-path) load-path)))

(defun append-path ( my-path )
(setq load-path (append load-path (list (expand-file-name my-path)))))
;; look first in the directory ~/.emacs.d/lisp for elisp files
(prepend-path "~/.emacs.d/lisp")
;; load verilog mode only when needed
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
;; any files that end in .v .dv or .sv should be in verilog mode
(add-to-list 'auto-mode-alist '("\\.[ds]?v\\'" . verilog-mode))
;; any files in verilog mode should have their keywords colorized
(add-hook 'verilog-mode-hook '(lambda () (font-lock-mode 1)))

;;
;; verilog mode customize
;; Enable syntax highlighting of **all** languages
(global-font-lock-mode t)

;; User customization for Verilog mode
(setq verilog-indent-level             4
      verilog-indent-level-module      4
      verilog-indent-level-declaration 4
      verilog-indent-level-behavioral  4
      verilog-indent-level-directive   4
      verilog-case-indent              4
      verilog-auto-newline             t
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        t
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              'declarations
      verilog-highlight-p1800-keywords nil
      verilog-linter			       "source /data/FS-MCU2/00.ENV/ia.license.cz2;spyglass -batch -f /data/FS-MCU2/33.SPYGLASS/01.LINT/3_POLICY/Samsung-verilog.spq -verilog"
)


;;
;; disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white smoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 96 :width normal :foundry "bitstream" :family "Bitstream Vera Sans Mono")))))

;; emacs's built-in backup settings
(make-directory "~/.emacs.d/backup" t)
(setq
    make-backup-files t
    auto-save-default t
    backup-by-copying t
    delete-old-versions t
    kept-new-versions 10
    kept-old-versions 10
    version-control t)
(setq
    backup-directory-alist `(("." . "~/.emacs.d/backup"))
    auto-save-file-name-transforms `((".*" ,"~/.emacs.d/backup" t))
    tramp-auto-save-directory "~/.emacs.d/backup")
;; auto-save every 100 input events
(setq auto-save-interval 100)
;; auto-save after 30 seconds idle time
(setq auto-save-timeout 30)


;;
;; linum
;(require `linum)
(global-linum-mode 1)
(add-hook 'find-file-hook (lambda() (linum-mode 1)))


;;
;; cz test
(defun cz-test ()
    (interactive)
    (message "Hi! CZ~")
    (message buffer-file-name)
    (message (split-string buffer-file-name "/"))
)

