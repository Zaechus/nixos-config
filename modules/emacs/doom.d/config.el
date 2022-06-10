;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(set-face-attribute 'default nil :height 110)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Maxwell Anderson"
      user-mail-address "maxwell.anderson.public@protonmail.com")

(setq doom-font (font-spec :family "Fira Code Nerd Font" :size 12)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type t)
