#lang racket
(let ((f1 -2))
  (sub1
   (cond
    (#t
     (cond
      (#f #f)
      (0 f1)
      (#f #f)
      (#\U0005317D f1)
      (#t #\U000506A5)
      (#f 2)
      (10 #f)
      (#\쳸 f1)
      (else #\U0010D931)))
    (#f (if f1 #f f1))
    (#\U000F7955 (zero? f1))
    (#t f1)
    ((if #f f1 f1) #t)
    ((cond
      (f1 #t)
      (#t -3)
      (#f 1)
      (f1 #f)
      (-2 #t)
      (1 #f)
      (#f 2)
      (#f #\堘)
      (f1 f1)
      (#f #t)
      (#t #f)
      (f1 #t)
      (#\U000F936F #t)
      (#f #\줃)
      (#\僕 1)
      (else 8))
     #t)
    (else
     (cond
      (#t #\࿆)
      (-3 #\飲)
      (2 #\U000EE965)
      (3 #t)
      (#t 3)
      (#t 2)
      (#f #\㜔)
      (f1 #f)
      (#t #t)
      (#f f1)
      (f1 f1)
      (else -3))))))
