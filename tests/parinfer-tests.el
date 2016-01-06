;; parinfer-tests.el -- Tests for parinfer-mode

(require 'ert)
(require 'parinfer)

(ert-deftest parinfer-simple ()
  (should (equal (enable-parinfer-mode)
                 t)
