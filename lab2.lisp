; Перше завдання
(defun remove-even-triples (lst &optional (index 1))
  (cond
    ((null lst) nil)
    (t
     (let ((group (subseq lst 0 (min 3 (length lst))))
           (rest (nthcdr 3 lst)))
       (if (evenp index)
           ;; парна трійка → пропускаємо
           (remove-even-triples rest (1+ index))
           ;; непарна → залишаємо
           (append group (remove-even-triples rest (1+ index))))))))

; Функції тестування першого завдання
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


; Друге завдання
(defun decompress-list (lst)
  (apply #'append
         (mapcar (lambda (pair)
                   (make-list (first pair) :initial-element (second pair)))
                 lst)))

; Функції тестування другого завдання
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

