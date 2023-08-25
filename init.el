;;; % -*- coding: iso-8859-15 -*-
;;; init.el --- load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;; (setq debug-on-error t)
;; ignore native compile warning
(setq warning-minimum-level :emergency)


;;; copy from "https://github.com/LuciusChen/.emacs.d/blob/main/init.el"
;;; for emacs version messages:
(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))
(format-message "Your Emacs version is: %s" emacs-version)


(setq user-init-file "~/.emacs.d/init.el")
;; (setq debug-on-error t)


;; telega.el suggest:
(setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.cn/emacs-elpa/gnu/")
			 ("nongnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/nongnu/")
			 ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
			 ("melpa-stable" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/stable-melpa/")
			 ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")))


;; copy from emacs-china.org,
;; for update elpa keyring when signature outdate:
(let ((package-check-signature nil))
  (package-install 'gnu-elpa-keyring-update))


;; stack exchange suggest about verify pubkey:
(setq package-gnupghome-dir "~/.emacs.d/elpa/gnupg")


;(add-to-list 'package-archives
;       '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/stable-melpa/"))
(add-to-list 'package-pinned-packages '(telega . "melpa-stable"))
(require 'telega)


;; about custom the emacs theme:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gnu-elpa gnu-elpa-keyring-update use-proxy ## all-the-icons telega))
 '(url-proxy-services nil))


;; Copy from "emacswiki.org/emacs/CustomThemes":
;; put the themes in custom subdirectories in order not to pollute the `~/emacs.d` folder:
;(add-to-list 'custom-theme-load-path "~/emacs.d/themes")


;; copy from "emacswiki.org/emacs/LineNumbers",
;; for show the line number:
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


;; load files:
;; copy from "emacswiki.org/emacs/LoadingLispFiles":
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))
		 ))
    (mapc load-it (directory-files dir nil "\\.el$"))))
(load-directory "~/.emacs.d/themes/")


(set-language-environment "UTF-8")


(provide 'init)


;; Local Variables:
;; coding: utl-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
