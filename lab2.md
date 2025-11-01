<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт до лабораторної роботи 2</b><br/>
"Рекурсія"<br/>
дисципліни "Вступ до функціонального програмування"
</p>

<p align="right"> 
<b>Студентка</b>: 
Оваденко Владислава КВ-21</p>

<p align="right"><b>Рік</b>: 2025</p>

## Загальне завдання
Реалізуйте дві рекурсивні функції, що виконують деякі дії з вхідним(и) списком(-ами), за
можливості/необхідності використовуючи різні види рекурсії. Функції, які необхідно
реалізувати, задаються варіантом (п. 2.1.1). Вимоги до функцій:
1. Зміна списку згідно із завданням має відбуватись за рахунок конструювання нового
списку, а не зміни наявного (вхідного).
2. Не допускається використання функцій вищого порядку чи стандартних функцій
для роботи зі списками, що не наведені в четвертому розділі навчального
посібника.
3. Реалізована функція не має бути функцією вищого порядку, тобто приймати функції
в якості аргументів.
4. Не допускається використання псевдофункцій (деструктивного підходу).
5. Не допускається використання циклів.
Кожна реалізована функція має бути протестована для різних тестових наборів. Тести
мають бути оформленні у вигляді модульних тестів (див. п. 2.3).

## Варіант 13

1. Написати функцію remove-even-triples , яка видалить парні трійки послідовних
елементів зі списку:
```lisp
CL-USER> (remove-even-triples '(a b c d e f g h))
(A B C G H)
```
2. Написати функцію decompress-list , яка "розпакує" зі списку пар виду (кількістьповторень елемент) послідовність елементів визначеної кількості:
```lisp
CL-USER> (decompress-list '((1 1) (2 a) (3 3) (1 4)))
(1 A A 3 3 3 4)
```

## Лістинг функції remove-even-triples
```lisp
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
```
### Тестові набори та утиліти
```lisp
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
```
### Тестування
```lisp
CL-USER> (test-remove-even-triples)
Test 2.1 passed...
Test 2.2 passed...
Test 2.3 passed...
Test 2.4 passed...
Test 2.5 passed...
NIL
```
## Лістинг функції decompress-list
```lisp
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
```
### Тестові набори та утиліти
```lisp
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
```
### Тестування
```lisp
CL-USER> (test-decompress-list)
Test 3.1 passed...
Test 3.2 passed...
Test 3.3 passed...
Test 3.4 passed...
Test 3.5 passed...
NIL
```

