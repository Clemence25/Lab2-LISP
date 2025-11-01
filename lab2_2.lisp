(defun decompress-list (lst)
  (cond
    ((null lst) nil)
    (t
     (append (repeat-element (caar lst) (cadar lst))
             (decompress-list (cdr lst))))))
             
(defun repeat-element (n elem)
  (if (<= n 0)
      nil
      (cons elem (repeat-element (1- n) elem))))

(defun check-decompress-list (name input expected)
  (format t "~:[FAILED~;passed~]... ~a~%"
          (equal (decompress-list input) expected)
          name))

(defun test-decompress-list ()
  (check-decompress-list "Test 3.1" '((1 1) (2 a) (3 3) (1 4)) '(1 a a 3 3 3 4))
  (check-decompress-list "Test 3.2" '((3 x)) '(x x x))
  (check-decompress-list "Test 3.3" '((1 a) (1 b) (1 c)) '(a b c))
  (check-decompress-list "Test 3.4" '((0 z) (2 q)) '(q q))
  (check-decompress-list "Test 3.5" '() '()))