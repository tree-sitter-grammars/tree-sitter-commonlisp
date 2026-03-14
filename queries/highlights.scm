;; Literals and Constants
(str_lit) @string
(num_lit) @number
(kwd_lit) @string.special.symbol
(nil_lit) @constant.builtin
(sym_lit) @variable

;; Known builtins
((sym_lit) @keyword
 (#any-of? @keyword
   "let" "let*" "if" "when" "unless" "cond" 
   "handler-bind" "destructuring-bind" 
   "case" "ecase" "typecase" "progn"))
(loop_macro "loop" @keyword)

(defun_header
  keyword: _ @keyword
  function_name: (sym_lit) @function)

;; Comments
(comment) @comment
(dis_expr) @comment

;; Punctuation
["(" ")"] @punctuation.bracket
["'" "`" "," ",@"] @punctuation.special
