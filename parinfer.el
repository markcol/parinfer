;;; parinfer.el -- minor mode for editing lispy code

;;; Copyright (C) 2015 Carl Dong.

;;; Author: Carl Dong
;;; Version: 0.1
;;; Created: 11 Nov 2015
;;; Modified: 07 Jan 2016
;;; Keywords: lisp indenting paredit package
;;; URL: https://github.com/dongcarl/parinfer

;;; Commentary:

;;; Parinfer provides automatic indenting and parenthesis matching
;;; when editing Lisp-like code.  It is conceptually similiar to
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

(defgroup parinfer nil
  "Minor mode for editing Lispy code."
  :group 'lisp
  :group 'extensions)

(defcustom parinfer-foo nil
  "Whether to do foo in parinfer or not."
  :type 'boolean
  :group 'parinfer)

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
  :group 'parinfer
  ;; TODO: handle enable and disable properly
  (if parinfer-mode
      (progn
        (parinfer-paren-mode)
	;; Add hook to front of hook list and make it a buffer-local hook
        (add-hook 'post-command-hook 'parinfer-indent-mode nil t))
    (remove-hook 'post-command-hook 'parinfer-indent-mode t)))

;;;###autoload
(defun enable-parinfer-mode ()
  "Turn on parinfer for the current buffer."
  (interactive)
  (parinfer-mode))

(defun disable-parinfer-mode ()
  "Turn off parinfer for the current buffer."
  (interactive)
  (parinfer-mode -1))

(provide 'parinfer)

;;; parinfer.el ends here
