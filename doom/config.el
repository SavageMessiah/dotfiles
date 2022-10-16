;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ken Allen"
      user-mail-address "kallen@lookingglasscyber.com")

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

(use-package! just-mode)

(use-package! graphql-mode)

(use-package! aggressive-indent
  :hook
  (clojure-mode . aggressive-indent-mode))

(use-package! evil-cleverparens
  :hook
  ((clojure-mode . evil-cleverparens-mode)
   (emacs-lisp-mode . evil-cleverparens-mode)
   (lisp-mode . evil-cleverparens-mode)
   (cider-repl-mode . evil-cleverparens-mode)))

(after! clojure-mode
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

(defun portal.api/open ()
  (interactive)
  (cider-nrepl-sync-request:eval
   "(portal.api/open)"))

(defun portal.api/clear ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/clear)"))

(defun portal.api/close ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/close)"))

(map! (:localleader
       (:map clojure-mode-map
        (:prefix ("o" . "portal")
         "o" #'portal.api/open
         "c" #'portal.api/clear
         "q" #'portal.api/close))))

(add-hook! clojure-mode
  (setq +format-with-lsp nil
        lsp-completion-enable nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-doc-enable t
        lsp-lens-enable t
        clojure-toplevel-inside-comment-form t)
  (set-fill-column 90)
  (display-fill-column-indicator-mode))

(after! cider-mode
  (setq cider-known-endpoints
        '(("Standard Cluster REPL" "localhost" "7777")))
  (add-hook! 'cider-mode-hook :append
    (defun +put-cider-comp-back ()
      (add-hook 'completion-at-point-functions #'cider-complete-at-point))))

(after! company
  (setq company-idle-delay 0.3))

;;maybe this can be replaced with (use-package! restclient-jq)
(after! restclient
  (require 'restclient-jq))

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(map! :leader
      :desc "Switch window" ";" #'ace-window
      :desc "Clear highlight" "s c" #'evil-ex-nohighlight)

(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5))

(after! org 
        (pushnew! org-link-abbrev-alist
                  '("jira" . "https://lgscout.atlassian.net/browse/%s")
                  '("hzn" . "https://lgscout.atlassian.net/browse/HZN-%s")
                  '("sp" .  "https://lgscout.atlassian.net/browse/SP-%s")))

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'.
   File name will be relative to the current projectile project root."
  (interactive)
  (letrec ((file-name (file-relative-name (buffer-file-name) (projectile-project-root)))
           (path-with-line-number
            (concat file-name ":" (number-to-string (line-number-at-pos)))))
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))

(use-package! git-link)

(after! git-link
  (map! :leader
        (:prefix "b"
         :desc "Copy file and line # to clipboard" "@" #'git-link)))
;;(:prefix "b"
;;         :desc "Copy file and line # to clipboard" "@" #'copy-current-line-position-to-clipboard)
