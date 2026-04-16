;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup packages
(require 'package)
(setq package-check-signature 'allow-unsigned)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)
;; Refresh if needed
(unless package-archive-contents
  (package-refresh-contents))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '((".*" . "~/.emacs.d/bak")))
 '(display-time-24hr-format t)
 '(display-time-mode t nil (time))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   '(clojure-mode crontab-mode dockerfile-mode ein ein-mumamo ellama elpy
     ess fill-column-indicator json-mode julia-mode markdown-mode matlab-mode
     python-mode toml-mode wolfram wolfram-mode yaml-mode))
 '(semantic-default-c-built-in-types
   '("void" "char" "int" "float" "double" "const" "volatile" "static"
     "unsigned" "signed" "bool" "pid_t" "key_t" "register_t" "size_t"
     "FILE" "list" "vector" "string" "istream" "ostream" "iostream"
     "fstream" "ifstream" "ofstream" "stringstream" "istringstream"
     "ostringstream" "multimap" "map" "set" "vector" "list"))
 '(visible-bell t))
;; all font faces...
(if (eq 'x window-system) ;; faces for x windows emacs...
    (custom-set-faces
     '(default ((t (:background "gray16" :foreground "white"))))
     '(font-lock-comment-face ((nil (:foreground "yellow"))))
     '(font-lock-preprocessor-face ((nil (:foreground "yellow"))))
     '(font-lock-constant-face ((nil (:foreground "lightblue"))))
     '(font-lock-string-face ((nil (:foreground "lightblue" :bold t))))
     '(font-lock-keyword-face ((nil (:foreground "cyan" :bold t))))
     '(font-lock-builtin-face ((nil (:foreground "magenta" :bold t))))
     '(font-lock-type-face ((nil (:foreground "magenta" :bold t))))
     '(font-lock-variable-name-face ((nil (:foreground "magenta"))))))
(if (eq 'ns window-system) ;; faces for aquamacs
    (custom-set-faces
     '(default ((t (:background "gray16" :foreground "white"))))
     '(autoface-default
       ((t (:inherit default :background "gray16" :foreground "white"))))
     '(minibuffer
       ((t (:inherit default :background "gray16" :foreground "white"))))
     '(font-lock-builtin-face ((nil (:foreground "cyan"))))
     '(font-lock-comment-face ((nil (:foreground "yellow"))))
     '(font-lock-constant-face ((nil (:foreground "white" :weight bold))))
     '(font-lock-keyword-face ((nil (:foreground "cyan" :weight bold))))
     '(font-lock-preprocessor-face ((nil (:foreground "yellow"))))
     '(font-lock-string-face ((nil (:foreground "blue" :bold t))))
     '(font-lock-type-face ((nil (:foreground "magenta" :bold t))))
     '(font-lock-variable-name-face ((nil (:foreground "magenta"))))
     '(paren-face-match ((nil (:background "green"))))
     '(paren-face-mismatch ((nil (:background "red"))))
     '(region ((nil (:foreground "white" :background "blue"))))))
(if (or (eq 'tty window-system)      ;; if we're in the terminal...
        (eq nil window-system))
    (custom-set-faces
     '(default ((t (:foreground "white" :weight bold))))
     '(font-lock-builtin-face ((nil (:foreground "cyan"))))
     '(font-lock-comment-face ((nil (:foreground "yellow" :weight bold))))
     '(font-lock-constant-face ((nil (:foreground "blue" :weight bold))))
     '(font-lock-keyword-face ((nil (:foreground "cyan" :weight bold))))
     '(font-lock-preprocessor-face ((nil (:foreground "yellow" :weight bold))))
     '(font-lock-string-face ((nil (:foreground "blue" :weight bold))))
     '(font-lock-type-face ((nil (:foreground "magenta"))))
     '(font-lock-variable-name-face
       ((nil (:foreground "magenta" :weight bold))))
     '(menu ((((type tty)) (:background "white" :foreground "black"))))
     '(menu-face ((nil (:foreground "white" :background "blue"))))
     '(mode-line ((t (:background "white" :foreground "black"))))
     '(paren-face-match ((nil (:background "green"))))
     '(paren-face-mismatch ((nil (:background "red"))))
     '(region-face ((nil (:foreground "white" :background "blue"))))))


;; More stuff... (6-1-2005)
;; -Noah

;; lines and columns!
(line-number-mode 1)
(column-number-mode 1)

;; mepla package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list
    'Info-directory-list
    "~/.emacs.d/site-lisp/use-package/"))

;; org-mode config
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cv" 'org-open-at-point)
(setq org-log-done t)

;; matlab mode
;(require 'matlab-mode)
;(require 'jabber-autoloads)
;(require 'scala-mode-auto)
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; Wolfram Mode
(autoload 'wolfram-mode "wolfram-mode" nil t)
(autoload 'run-wolfram "wolfram-mode" nil t)
;(setq wolfram-program "/Applications/Mathematica.app/Contents/MacOS/MathKernel")
;(add-to-list 'auto-mode-alist '("\\.m$" . wolfram-mode))

;; D mode
(autoload 'd-mode "d-mode" "Major mode for editing D code." t)

;; text mode hooks...
(add-hook 'text-mode-hook
          '(lambda nil
             (setq fill-column 79)
             (auto-fill-mode 0)
             (global-set-key "\M-p" 'fill-paragraph)))
(add-hook 'tex-mode-hook
          '(lambda nil
             (setq fill-column 79)
             (auto-fill-mode t)
             (global-set-key "\M-p" 'fill-paragraph)))

;; programming mode hooks
(add-hook 'c-mode-hook
      '(lambda nil 
         (setq fill-column 79)
	 (setq truncate-lines t)))
(add-hook 'c++-mode-hook
      '(lambda nil 
         (setq fill-column 79)
	 (setq truncate-lines t)))
(add-hook 'java-mode-hook
      '(lambda nil 
	 (setq fill-column 79)
         (setq truncate-lines t)))
(add-hook 'perl-mode-hook
      '(lambda nil 
	 (setq fill-column 79)
         (setq truncate-lines t)))
(add-hook 'matlab-mode-hook
          '(lambda nil
             (setq fill-column 120)
             (setq truncate-lines t)
             (auto-fill-mode t)))
(add-hook 'python-mode-hook
          '(lambda nil
             (setq fill-column 79)))
(add-hook 'sh-mode-hook
          '(lambda nil
             (setq fill-column 79)))

;(require 'paredit)
;(defun turn-on-paredit () (paredit-mode 1))

;(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook 
   '(lambda () 
      (setq fill-column 79)
      (setq inferior-lisp-program "lein repl")
      (add-hook 'inferior-lisp-mode-hook
         (lambda ()
           (setq comint-use-prompt-regexp t)
           (setq comint-prompt-read-only nil)
           (setq comint-move-point-for-output t)
           (setq comint-move-point-for-input t)
           (setq inferior-lisp-prompt "^:?> (:?> )*")
           (setq comint-prompt-regexp inferior-lisp-prompt)))
      (put-clojure-indent 'apply 1)
      (put-clojure-indent 'def 1)
      (put-clojure-indent 'ref-set 1)
      (put-clojure-indent 'case 1)
      (put-clojure-indent 'conj! 1)
      (put-clojure-indent 'assoc! 1)))
(defun clojure-run ()
  (interactive)
  (run-lisp "lein repl")
  (switch-to-buffer "*inferior-lisp*"))
(add-hook 'clj-mode-hook 
          '(lambda () (setq inferior-lisp-program "clj")))
(defun clj-run ()
  (interactive)
  (run-lisp "clj")
  (switch-to-buffer "*inferior-lisp*"))

;; font locking always on
(font-lock-mode 1)

;; 3 space indentation
(setq c-basic-offset 3)

;; private/public/protected indentation
(c-set-offset 'access-label -1)

;; Mode detection.
(setq auto-mode-alist 
   (mapcar 'purecopy
     '(("\\.c$" . c-mode)
       ("\\.cpp$" . c++-mode)
       ("\\.cxx$" . c++-mode)
       ("\\.cc$" . c++-mode)
       ("\\.java$" . java-mode)
       ("\\.C$". c++-mode)
       ("\\.d[i]?\\'" . d-mode)
       ("\\.h$" . c-mode)
       ("\\.hh$" . c++-mode)
       ("\\.hpp$" . c++-mode)
       ("\\.clj$" . clojure-mode)
       ("\\.py$" . python-mode)
       ("\\.cs$" . csharp-mode)
       ("\\.bib$" . bibtex-mode)
       ("\\.tex$" . LaTeX-mode)
       ("\\.sty$" . LaTeX-mode)
       ("\\.txi$" . Texinfo-mode)
       ("\\.el$" . emacs-lisp-mode)
       ("\\.pl$" . perl-mode)
       ("\\.pro$" . prolog-mode)
       ("\\.html$" . html-mode)
       ("\\.xml$" . xml-mode)
       ("\\.lsp$" . lisp-mode)
       ("\\.lisp$" . lisp-mode)
       ("\\.emacs$" . lisp-mode)
       ("\\.cl$" . lisp-mode)
       ("\\.l$" . lisp-mode)
       ("\\.json$" . json-mode)
       ("\\.jl$" . julia-mode)
       ("\\.jul$" . julia-mode)
       ("\\.julia$" . julia-mode)
       ("\\.makefile$" . makefile-mode)
       ("Makefile$" . makefile-mode)
       ("makefile$" . makefile-mode)
       ("\\.txt$" . text-mode)
       ("\\.me$" . text-mode)
       ("\\.R$" . ess-mode)
       ("\\.README$" . text-mode)
       ("^README$" . text-mode)
       ("^0README$" . text-mode)
       (".*READ\\.ME$" . text-mode)
       (".profile$" . sh-mode)
       (".bash_profile$" . sh-mode)
       (".bashrc$" . sh-mode)
       ("Dockerfile$" . dockerfile-mode)
       ("\\.doc$" . text-mode)
       ("\\.md$" . markdown-mode)
       ("\\.csh$" . csh-mode)
       ("\\.sh$" . sh-mode)
       ("\\.bashrc$" . sh-mode)
       ("\\.profile$" . sh-mode)
       ("\\.bash_profile$" . sh-mode)
       ("\\.sc$" . scala-mode)
       ("\\.scala$" . scala-mode)
       ("\\.sbt$" . scala-mode)
       ("\\.inf$" . inform-mode)
       ;("\\.m$" . matlab-mode)
       ("\\.m$" . mathematica-mode)
       ("\\.mma$" . mathematica-mode)
       ("\\.org$" . org-mode)
       ("\\.a$" . c-mode)
       ("\\.tml" . toml-mode)
       ("\\.toml" . toml-mode)
       ("\\.yml$" . yaml-mode)
       ("\\.yaml$" . yaml-mode))))

;; differences between xemacs and emacs...
(if (or (not (functionp #'xemacsp))
        (not xemacsp))
    (progn
      (global-set-key "\C-h" 'help)
      (global-set-key "\M-g" 'goto-line) ;; this is absolutely necessary IMHO
      (global-font-lock-mode 1)
      ;; no tool or menu bars
      ;(tool-bar-mode -1)
      (menu-bar-mode -1)))

(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "white" :weight bold))))
 '(font-lock-builtin-face ((nil (:foreground "cyan"))))
 '(font-lock-comment-face ((nil (:foreground "yellow" :weight bold))))
 '(font-lock-constant-face ((nil (:foreground "blue" :weight bold))))
 '(font-lock-keyword-face ((nil (:foreground "cyan" :weight bold))))
 '(font-lock-preprocessor-face ((nil (:foreground "yellow" :weight bold))))
 '(font-lock-string-face ((nil (:foreground "blue" :weight bold))))
 '(font-lock-type-face ((nil (:foreground "magenta"))))
 '(font-lock-variable-name-face ((nil (:foreground "magenta" :weight bold))))
 '(menu ((((type tty)) (:background "white" :foreground "black"))))
 '(menu-face ((nil (:foreground "white" :background "blue"))))
 '(mode-line ((t (:background "white" :foreground "black"))))
 '(paren-face-match ((nil (:background "green"))))
 '(paren-face-mismatch ((nil (:background "red"))))
 '(region-face ((nil (:foreground "white" :background "blue")))))
