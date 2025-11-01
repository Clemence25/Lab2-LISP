(defun remove-even-triples (lst &optional (even nil) (acc '()))
  (cond
    ((null lst) (reverse acc))
    ((< (length lst) 3)
     (if even
         (reverse acc)
         (reverse (append (reverse lst) acc))))
    (t
     (let ((a (first lst))
           (b (second lst))
           (c (third lst))
           (rest (nthcdr 3 lst)))
       (if even
           (remove-even-triples rest (not even) acc)
           (remove-even-triples rest (not even)
                                (list* c b a acc)))))))

(defun check-remove-even-triples (name input expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (remove-even-triples input) expected)
          name))

(defun test-remove-even-triples ()
  (check-remove-even-triples "Test 2.1" '(a b c d e f g h) '(a b c g h))
  (check-remove-even-triples "Test 2.2" '(1 2 3 4 5 6 7 8 9) '(1 2 3 7 8 9))
  (check-remove-even-triples "Test 2.3" '(a b c) '(a b c))
  (check-remove-even-triples "Test 2.4" '(a b c d e f) '(a b c))
  (check-remove-even-triples "Test 2.5" '() '()))
