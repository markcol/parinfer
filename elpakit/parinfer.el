;; parinfer.el build parinfer and tests

(require 'elpakit)

(elpakit
 "/tmp/parinfer"
 '("~/src/parinfer"))

(elpakit-test
 '("~/src/parinfer")
'parinfer-tests
'parinfer)
