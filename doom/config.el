;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


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
(setq doom-font (font-spec :family "Fira Code" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem)

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

(use-package! aggressive-indent
  :hook
  (clojure-mode . aggressive-indent-mode))

(use-package! evil-cleverparens
  :init
  (setq evil-cleverparens-use-s-and-S nil)
  :hook
  ((clojure-mode . evil-cleverparens-mode)
   (emacs-lisp-mode . evil-cleverparens-mode)
   (lisp-mode . evil-cleverparens-mode)
   (cider-repl-mode . evil-cleverparens-mode)))

(after! clojure-mode
  (setq cider-dynamic-indentation nil)
  (define-clojure-indent
   (\?> 1)
   (match 1)
   (for-map 1)

   (<<sources 1)
   (<<if 1)
   (<<subsource 1)
   (<<query-topology 3)
   (case> 0)
   ))

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

(after! clojure-mode
  (define-clojure-indent))

(after! cider-mode
  (add-hook! 'cider-mode-hook :append
    (defun +put-cider-comp-back ()
      (add-hook 'completion-at-point-functions #'cider-complete-at-point))))

(after! company
  (map! (:map company-active-map
              "C-SPC" #'company-complete-selection
              "RET" nil
              "<return>") nil)
  (setq company-idle-delay 0.3))

;;maybe this can be replaced with (use-package! restclient-jq)
(after! restclient
  (require 'restclient-jq))

(map! :leader
      :desc "Switch window" ";" #'ace-window
      :desc "Clear highlight" "s c" #'evil-ex-nohighlight)

(custom-set-faces!
  '(aw-leading-char-face
    :foreground "white" :background "red"
    :weight bold :height 2.5))
