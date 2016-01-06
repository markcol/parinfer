;; parinfer-tests.el -- Tests for parinfer-mode

(require 'ert)
(require 'parinfer)

(ert-deftest parinfer-simple ()
  (should (equal (enable-parinfer-mode)
                 t)))

(ert-deftest parinfer-files ()
  (should
   (elpakit/mematch
    ".*\\.el"
    (("parinfer.el"
      "parinfer-indent-mode.el"
      "parinfer-pkg.el"
      "parinfer-reader.el"
      "parinfer-string.el"
      "parinfer-utils.el"
      "README.md")))))

;;; parinfer-tests.el ends here
