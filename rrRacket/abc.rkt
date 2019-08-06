#lang racket

; 该模块是 zhengrr 学习 The Racket Guide 的笔记

(require rackunit)

;================================================================================
; 欢迎来到 Racket
; Welcome to Racket
; https://docs.racket-lang.org/guide/intro.html

; -------------------------------------------------------------------------------
; 定义区域 Definitions Area
; 除 (、)、[、]、{、}、"、,、'、`、;、#、|、\ 和纯数字外，几乎所有非空序列都可作标识符

; 绑定表达式结果到标识符
; Lisp 惯用连接号分隔单词，Racket 循此例
(define project-name
  "rrRacket")

; 绑定过程到标识符
; 个人为区分标识符作用域，在上下文中前缀 : 标记，标记可堆叠 :: :3: :4:
(define (plus1 :num)
  (+ :num 1))

; 应用过程
(check-equal? 1
              (plus1 0))

; -------------------------------------------------------------------------------
; 若使用 DrRacket IDE，那么下方应存在一个交互（interaction）窗口，
; 　　称作读取求值打印循环（read-eval-print loop, REPL）。
;
; 在命令行环境，可通过 (enter! "abc.rkt") 加载代码和上下文。

;================================================================================
; Racket 要点
; Racket Essentials
; https://docs.racket-lang.org/guide/to-scheme.html

; -------------------------------------------------------------------------------
; 条件句，只有 #f 为假，此外都为真

(check-equal? "true-expr"
              (if #t
                  "true-expr"
                  "false-expr"))

(check-equal? #t
              (and #t
                   #t
                   #t))

(check-equal? #f
              (or #f
                  #f
                  #f))

; Racket 中圆括号和方括号可成对互换
(check-equal? "cond2-expr"
              (cond
                [#f   "cond0-expr"]
                [#f   "cond1-expr"]
                [#t   "cond2-expr"]
                [#t   "cond3-expr"]
                [else "else-expr"]))

; -------------------------------------------------------------------------------
; 匿名过程 Anonymous Procedure

(define plus2
  (lambda (:num) (+ :num 2)))

(check-equal? 2
              (plus2 0))

; -------------------------------------------------------------------------------
; 词法闭包 Lexical Closure

(define (make-plus-n :n)
  (lambda (::num) (+ ::num :n)))

(define plus3
  (make-plus-n 3))

(check-equal? 3
              (plus3 0))

;================================================================================
; 内置数据类型
; Built-In Datatypes
; https://docs.racket-lang.org/guide/datatypes.html

; 布尔值 Boolean
; 首选小写形式字面量
(check-true (boolean? #t))
(check-true (boolean? #f))
(check-true (boolean? #T))
(check-true (boolean? #F))

; 数值 Number
(check-true (integer?  #b1))
(check-true (integer?  #o7))
(check-true (integer?  9))
(check-true (integer?  #xF))
(check-true (rational? 0.5))
(check-true (real?     (sqrt 2)))
(check-true (complex?  1+1i ))

; 字符 Character
; TO BE CONTINUE
