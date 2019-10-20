#lang racket
(require racket/base)
(require racket/list)
(require pollen/core)
(require pollen/decode)
(require pollen/tag)
(require txexpr)

(provide root snippet code takeover)

(define (search-replace xs ys pred?)
   (search-replace 
        (append 
            (splitf-at xs (lambda (x) (not (pred? x)))) 
                (cons (first ys) (rest (last (splitf-at xs pred?))
            )
        )
    ) (rest ys) pred?)
)

(define (root . items) 
    (map (lambda (elem)
            (let ([takefront (filter (not string?) elem)]
                   [texts (map (lambda (e) (txexpr '(div (class "text") e)))
                        (filter (string?) elem))]) 
                (search-replace (search-replace elem texts)) takefront))
        (decode (txexpr 'root '() items)
            #:txexpr-elements-proc decode-paragraphs
        )
    )
)

(define-tag-function (snippet attrib elems)
    `(div ,((class "snippet") ~a attrib) ,elems)
)

(define-tag-function (code attrib elems)
    '(pre '() `(code ,attrib ,elems))
)

(define-tag-function (takeover attrib elems)
    `(div ,((class "takeover") ~a attrib) ,elems)
)

(define-tag-function (math _ xs)
  `(mathjax () ,(apply string-append `("$" ,@xs "$")))
)

(define-tag-function (math-block _ xs)
  `(mathjax () ,(apply string-append `("$$" ,@xs "$$")))
)

