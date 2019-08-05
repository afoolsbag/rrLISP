#lang racket

(require rackunit)

;--------------------------------------------------------------------------------
; 定义区域 definitions area
;
; 除 (、)、[、]、{、}、"、,、'、`、;、#、|、\ 和纯数字外，几乎所有非空序列都可作标识符

; 绑定表达式结果到标识符
(define project-name "rrRacket")

; 绑定过程到标识符
(define (plus1 num)
  (+ num 1))

(define 1plus1 (plus1 1))

(check-equal? 2 1plus1)

;--------------------------------------------------------------------------------
; 条件句，只有 #f 为假，此外都为真

(check-equal?
 "true-expr"
 (if #t
     "true-expr"
     "false-expr"))

(check-equal?
 #t
 (and #t
      #t
      #t))

(check-equal?
 #f
 (or #f
     #f
     #f))

; Racket 中圆括号和方括号可成对互换
(check-equal?
 "cond2-expr"
 (cond
   [#f   "cond0-expr"]
   [#f   "cond1-expr"]
   [#t   "cond2-expr"]
   [#t   "cond3-expr"]
   [else "else-expr"]))

;--------------------------------------------------------------------------------
; 匿名过程

(define (twice-appl proc val)
  (proc (proc val)))

(check-equal?
 "appl:.."
 (twice-appl (lambda (arg) (string-append arg "."))
             "appl:"))

;--------------------------------------------------------------------------------
; 闭包和词法作用域 lexically scoped

(define (make-add-suffix suffix)
  (lambda (string) (string-append string suffix)))

(define louder (make-add-suffix "!"))

;--------------------------------------------------------------------------------
; 若使用 DrRacket IDE，那么下方应存在一个交互（interaction）窗口，
;   称作读取求值打印循环（read-eval-print loop, REPL）。

; 在命令行环境，可通过 (enter! "abc.rkt") 加载代码和上下文。
