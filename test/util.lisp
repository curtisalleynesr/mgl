(in-package :mgl-test)

(defun ~= (x y &optional (tolerance 0.001))
  (< (abs (- y x)) tolerance))

(defun vector= (v1 v2)
  (and (vectorp v1)
       (vectorp v2)
       (every #'= v1 v2)))

(defmacro do-cuda (() &body body)
  `(loop for enabled in (if (cuda-available-p)
                            '(nil t)
                            '(nil))
         do (with-cuda* (:enabled enabled) ,@body)))
