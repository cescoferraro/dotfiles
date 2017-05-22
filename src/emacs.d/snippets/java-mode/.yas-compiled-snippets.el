;;; Compiled snippets and support files for `java-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'java-mode
		     '(("try" "try {\n    $0\n}\ncatch (${1:Throwable e}) {\n      ${2:System.out.println(\"Error \" + e.getMessage());\n      e.printStackTrace();}\n}\n" "try" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/try" nil nil)
		       ("toStr" "public String toString() {\n       $0\n}" "toString" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/toString" nil nil)
		       ("." "this.$0" "this" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/this" nil nil)
		       ("tc" "import junit.framework.*;\nimport junit.textui.*;\n\npublic class Test${1:Class} extends TestCase {\n       protected void setUp() {\n                 $0\n       }\n}" "testClass" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/testClass" nil nil)
		       ("test" "@Test\npublic void test_${1:Case}() {\n       $0\n}" "test" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/test" nil nil)
		       ("sout" "System.out.println($0);" "sout" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/sout" nil nil)
		       ("ret" "@return ${1:description}" "return" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/return" nil nil)
		       ("pr" "System.out.println(\"${1:text}\");\n$0" "println" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/println" nil nil)
		       ("printf" "System.out.printf(\"$0%n\");" "printf" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/printf" nil nil)
		       ("param" "@param ${1:paramater} $0" "param" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/param" nil nil)
		       ("new" "${1:Type} ${2:obj} = new ${3:Constr}(${4:args});\n$0" "new" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/new" nil nil)
		       ("method" "${1:public }${2:void} ${3:name} (${4:args}) {\n           $0\n}" "method" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/method" nil nil)
		       ("main" "public static void main(String[] args) {\n       $0\n}" "main" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/main" nil nil)
		       ("doc" "/**\n * $0\n *\n */" "javadoc" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/javadoc" nil nil)
		       ("iterator" "public Iterator<${1:type}> iterator() {\n       $0\n}\n" "iterator" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/iterator" nil nil)
		       ("imp" "import ${1:System.};\n$0" "import" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/import" nil nil)
		       ("ife" "if (${1:cond}) {\n    $2\n}\nelse {\n     $3\n}" "ife" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/ife" nil nil)
		       ("if" "if (${1:condition) {\n   $0\n}" "if" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/if" nil nil)
		       ("fori" "for (${1:Object el} : ${2:iterator}) {\n    $0\n}\n" "fori" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/fori" nil nil)
		       ("for" "for (${1:int i = 0}; ${2:i < N}; ${3:i++}) {\n    $0\n}" "for" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/for" nil nil)
		       ("file" "public class ${1:`(file-name-base\n                    (or (buffer-file-name)\n                        (buffer-name)))`} {\n  $0\n}\n" "file_class" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/file_class" nil nil)
		       ("eq" "public boolean equals(${1:Class} other) {\n       $0\n}" "equals" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/equals" nil nil)
		       ("/*" "/**\n * ${1:documentation}\n */" "doc" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/doc" nil nil)
		       ("cls" "class ${1:Class} {\n      $0\n}" "cls" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/cls" nil nil)
		       ("apr_assert" "if (Globals.useAssertions) {\n   ${1:assert ..};\n}\n" "apr_assert" nil nil nil "/Users/cesco/.emacs.d/snippets/java-mode/apr_assert" nil nil)))


;;; Do not edit! File generated at Mon May 22 13:01:31 2017
