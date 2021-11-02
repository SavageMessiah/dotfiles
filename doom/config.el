;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after [modifying] this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ken Allen"
      user-mail-address "cardboard42@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Source Code Pro" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq deft-directory "~/notes")
(setq deft-use-filename-as-title nil)

(setq doom-localleader-key ",")

(setq confirm-kill-emacs nil)

(use-package! aggressive-indent
  :hook
  (clojure-mode . aggressive-indent-mode))

(use-package! evil-cleverparens
  :hook
  ((clojure-mode . evil-cleverparens-mode)
   (lisp-mode . evil-cleverparens-mode)
   (emacs-lisp-mode . evil-cleverparens-mode)))

(add-hook! clojure-mode
  (set-fill-column 90)
  (setq cider-dynamic-indentation nil)
  (define-clojure-indent
    (be/deftype 1)
    (be/impl 1)
    (\?> 1)
    (condas-> 2)
    (prop/for-all 1)
    (abstract/extend-schema 3)
    (match 1)
    (for-map 1)
    (log/extend-context 1)
    (stats/send-time 1)
    (dlock/if-lock 1)))

(add-hook! treemacs-mode
           (turn-on-solaire-mode))

(after! company
  (setq company-idle-delay 0.3))

(after! browse-url
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"))

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(map! :leader
      "0"   #'winum-select-window-0-or-10
      "1"   #'winum-select-window-1
      "2"   #'winum-select-window-2
      "3"   #'winum-select-window-3
      "4"   #'winum-select-window-4
      "5"   #'winum-select-window-5
      "6"   #'winum-select-window-6
      "7"   #'winum-select-window-7
      "8"   #'winum-select-window-8
      "9"   #'winum-select-window-9
      "a"   #'ace-window
      :desc "Clear highlight" "s c" #'evil-ex-nohighlight)

(use-package! just-mode)
(add-to-list 'auto-mode-alist '("/Justfile\\'" . just-mode))
