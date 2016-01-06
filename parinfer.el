;;; parinfer.el -- minor mode for editing lispy code

;;; Copyright (C) 2015 Carl Dong.

;;; Author: Carl Dong
;;; Version 1.0beta
;;; Created: 11 Nov 2015
;;; Modified: 07 Jan 2016
;;; Package-Version: 20160107.1
;;; Keywords: lisp indenting paredit package
;;; URL: https://github.com/dongcarl/parinfer

;;; Commentary:

;;; Parinfer provides automatic indenting and parenthesis matching
;;; when editing Lisp-like code. It is conceptually similiar to
;;; `paredit' but uses a completely different method to overcome some
;;; of the inheritent short-comings of `paredit' and other, similar
;;; packages.
;;;
;;; See http://shaunlebron.github.io/parinfer for more information on
;;; Parinfer and how it works.
;;;
;;; To start parinfer-mode for a given buffer, use:
;;;
;;;   `M-x enable-parinfer-mode RET'.
;;;
;;; To automatically enable it for a given major mode (e.g.,
;;; `emacs-lisp'), add it to the major-mode hook:
;;;
;;;   (add-hook 'emacs-lisp-mode-hook #'enable-parinfer-mode)
;;;
;;; See README.md for further documentation.

;;; Code:

(defconst parinfer-version 1)
(defconst parinder-beta-version t)

;;;###autoload
(defun parinfer-paren-mode
    (&optional
     (text (buffer-string))
     (cursor-line (- (line-number-at-pos) 1))
     (cursor-x (column-number-at-pos (point)))))

;;;###autoload
(defun parinfer-indent-mode
    (&optional
     (text (buffer-string))
     (cursor-line (- (line-number-at-pos) 1))
     (cursor-x (column-number-at-pos (point)))))

;;;###autoload
(define-minor-mode parinfer-mode
  "Uses Parinfer to Format lispy code"
  :ligher " parinfer"
  (if parinfer
      (progn
        (parinfer-paren-mode)
	;; Add hook to front of hook list and make it a buffer-local hook
        (add-hook 'post-command-hook 'parinfer-indent-mode nil t))
    (remove-hook 'post-command-hook 'parinfer-indent-mode t)))

;;;###autoload
(defun enable-parinfer-ident-mode ()
  "Turn on parinfer for the current buffer."
  (interactive)
  (parinfer-indent-mode +1))

(defun disable-parinfer-indent-mode ()
  "Turn off parinfer for the current buffer."
  (interactive)
  (parinfer-indent-mode -1))

;;;###autoload
(defun enable-parinfer-paren-mode ()
  "Turn on parinfer for the current buffer."
  (interactive)
  (parinfer-paren-mode +1))

(defun disable-parinfer-parend-mode ()
  "Turn off parinfer for the current buffer."
  (interactive)
  (parinfer-paren-mode -1))

(provide 'parinfer)
