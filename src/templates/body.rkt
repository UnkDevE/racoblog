#lang racket
(require pollen/core)
(require pollen/decode)
(require txexpr)

(define (interpolate-r xxs xs ys)
    (if (not (or (empty? xs) (empty? ys)))
        (interpolate-r `(,(first xs) ,(first ys)) (rest xs) (rest ys))
        (if (and (empty? xs) (not (empty? ys)))
            (~a xxs xs)
            (if (and (empty? ys) (not (empty? xs)))
                (~a xxs ys)
                xxs
            )
        )
    )
)

(define (interpolate xs ys)
    (interpolate-r '() xs ys)
)

(define (root . items) 
    (map (lambda (elem)
            (let ([takefront (filter (not string?) elem)]
                   [texts (map (lambda (e) (txexpr 'text '(class "text") e))
                        (filter (string?) elem))]) 
                (interpolate texts takefront)))
        (decode (txexpr 'root '() items)
            #:txexpr-elements-proc decode-paragraphs
        )
    )
)
