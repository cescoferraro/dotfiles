;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("fw" "from __future__ import with_statement" "with_statement" nil
			("future")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/with_statement" nil nil)
		       ("with" "with ${1:expr}${2: as ${3:alias}}:\n     $0" "with" nil
			("control structure")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/with" nil nil)
		       ("wh" "while ${1:True}:\n      $0" "while" nil
			("control structure")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/while" nil nil)
		       ("utf8" "# -*- coding: utf-8 -*-\n" "utf-8 encoding" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/utf8" nil nil)
		       ("un" "def __unicode__(self):\n    $0" "__unicode__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/unicode" nil nil)
		       ("try" "try:\n    $1\nexcept $2:\n    $3\nelse:\n    $0" "tryelse" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/tryelse" nil nil)
		       ("try" "try:\n    $1\nexcept ${2:Exception}:\n    $0" "try" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/try" nil nil)
		       ("tr" "import pdb; pdb.set_trace()" "trace" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/trace" nil nil)
		       ("tf" "import unittest\n${1:from ${2:test_file} import *}\n\n$0\n\nif __name__ == '__main__':\n    unittest.main()" "test_file" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/test_file" nil nil)
		       ("tcs" "class Test${1:toTest}(${2:unittest.TestCase}):\n      $0\n" "test_class" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/test_class" nil nil)
		       ("super" "super(${1:Class}, self).${2:function}(${3:args})" "super" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/super" nil nil)
		       ("str" "def __str__(self):\n    $0" "__str__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/str" nil nil)
		       ("sm" "@staticmethod\ndef ${1:func}($0):\n" "static" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/static" nil nil)
		       ("size" "sys.getsizeof($0)" "size" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/size" nil nil)
		       ("setup" "from setuptools import setup\n\npackage = '${1:name}'\nversion = '${2:0.1}'\n\nsetup(name=package,\n      version=version,\n      description=\"${3:description}\",\n      url='${4:url}'$0)\n" "setup" nil
			("distribute")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/setup" nil nil)
		       ("setdef" "${1:var}.setdefault(${2:key}, []).append(${3:value})" "setdef" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/setdef" nil nil)
		       ("sn" "self.$1 = $1" "selfassign" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/selfassign" nil nil)
		       ("s" "self" "self_without_dot" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/self_without_dot" nil nil)
		       ("." "self.$0" "self" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/self" nil nil)
		       ("script" "#!/usr/bin/env python\n\ndef main():\n   pass\n\nif __name__ == '__main__':\n   main()\n" "script" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/script" nil nil)
		       ("r" "return $0" "return" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/return" nil nil)
		       ("repr" "def __repr__(self):\n    $0" "__repr__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/repr" nil nil)
		       ("reg" "${1:regexp} = re.compile(r\"${2:expr}\")\n$0" "reg" nil
			("general")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/reg" nil nil)
		       ("prop" "def ${1:foo}():\n   doc = \"\"\"${2:Doc string}\"\"\"\n   def fget(self):\n       return self._$1\n\n   def fset(self, value):\n       self._$1 = value\n\n   def fdel(self):\n       del self._$1\n   return locals()\n$1 = property(**$1())\n\n$0\n" "prop" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/prop" nil nil)
		       ("p" "print($0)" "print" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/print" nil nil)
		       ("ps" "pass" "pass" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/pass" nil nil)
		       ("pars" "parser = argparse.ArgumentParser(description='$1')\n$0" "parser" nil
			("argparser")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/parser" nil nil)
		       ("pargs" "def parse_arguments():\n    parser = argparse.ArgumentParser(description='$1')\n    $0\n    return parser.parse_args()" "parse_args" nil
			("argparser")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/parse_args" nil nil)
		       ("np" "import numpy as np\n$0" "np" nil
			("general")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/np" nil nil)
		       ("not_impl" "raise NotImplementedError" "not_impl" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/not_impl" nil nil)
		       ("md" "def ${1:name}(self$2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "method_docstring" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/method_docstring" nil nil)
		       ("m" "def ${1:method}(self${2:, $3}):\n    $0" "method" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/method" nil nil)
		       ("mt" "__metaclass__ = type" "metaclass" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/metaclass" nil nil)
		       ("main" "def main():\n    $0" "main" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/main" nil nil)
		       ("log" "logger = logging.getLogger(\"${1:name}\")\nlogger.setLevel(logging.${2:level})\n" "logging" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/logging" nil nil)
		       ("ln" "logger = logging.getLogger(__name__)" "logger_name" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/logger_name" nil nil)
		       ("li" "[${1:el} for $1 in ${2:list}]\n$0" "list" nil
			("definitions")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/list" nil nil)
		       ("lam" "lambda ${1:x}: $0" "lambda" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/lambda" nil nil)
		       ("iter" "def __iter__(self):\n    return ${1:iter($2)}" "__iter__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/iter" nil nil)
		       ("int" "import code; code.interact(local=locals())" "interact" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/interact" nil nil)
		       ("id" "def __init__(self$1):\n    \\\"\\\"\\\"$2\n    ${1:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "init_docstring" nil
			("definitions")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/init_docstring" nil nil)
		       ("init" "def __init__(self${1:, args}):\n    ${2:\"${3:docstring}\"\n    }$0" "init" nil
			("definitions")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/init" nil nil)
		       ("imp" "import ${1:lib}${2: as ${3:alias}}\n$0" "import" nil
			("general")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/import" nil nil)
		       ("ifm" "if __name__ == '__main__':\n   ${1:main()}" "ifmain" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/ifmain" nil nil)
		       ("ife" "if $1:\n   $2\nelse:\n   $0" "ife" nil
			("control structure")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/ife" nil nil)
		       ("if" "if ${1:cond}:\n   $0" "if" nil
			("control structure")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/if" nil nil)
		       ("fd" "def ${1:name}($2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-docstring)}\n    \\\"\\\"\\\"\n    $0" "function_docstring" nil
			("definitions")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/function_docstring" nil nil)
		       ("f" "def ${1:fun}(${2:args}):\n    $0\n" "function" nil
			("definitions")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/function" nil nil)
		       ("from" "from ${1:lib} import ${2:funs}" "from" nil
			("general")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/from" nil nil)
		       ("for" "for ${var} in ${collection}:\n    $0" "for ... in ... : ..." nil
			("control structure")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/for" nil nil)
		       ("flask" "from flask import Flask, render_template\n\napp = Flask(__name__)\n\n\n@app.route(\"/\")\ndef index():\n    return \"hello\"\n\n$0\n\nif __name__ == \"__main__\":\n   app.debug = True\n   app.run(host=\"0.0.0.0\", port=8000)\n" "flask" nil nil
			((yas-indent-line 'fixed)
			 (yas-wrap-around-region 'nil))
			"/Users/cesco/.emacs.d/snippets/python-mode/flask.yasnippet" nil nil)
		       ("eq" "def __eq__(self, other):\n    return self.$1 == other.$1" "__eq__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/eq" nil nil)
		       ("doc" ">>> ${1:function calls}\n${2:desired output}\n$0" "doctest" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/doctest" nil nil)
		       ("d" "\"\"\"$0\n\"\"\"" "doc" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/doc" nil nil)
		       ("dt" "def test_${1:long_name}(self):\n    $0" "deftest" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/deftest" nil nil)
		       ("dec" "def ${1:decorator}(func):\n    $2\n    def _$1(*args, **kwargs):\n        $3\n        ret = func(*args, **kwargs)\n        $4\n        return ret\n\n    return _$1" "dec" nil
			("definitions")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/dec" nil nil)
		       ("cls" "class ${1:class}:\n      $0" "cls" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/cls" nil nil)
		       ("cm" "@classmethod\ndef ${1:meth}(cls, $0):\n    " "classmethod" nil
			("object oriented")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/classmethod" nil nil)
		       ("cdb" "from celery.contrib import rdb; rdb.set_trace()" "celery pdb" nil
			("celery")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/celery_pdb" nil nil)
		       ("an" "self.assertNotIn(${1:member}, ${2:container})" "assetNotIn" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assetNotIn" nil nil)
		       ("at" "self.assertTrue($0)" "assertTrue" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assertTrue" nil nil)
		       ("ar" "with self.assertRaises(${1:Exception}):\n     $0\n" "assertRaises" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/assertRaises.with" nil nil)
		       ("ar" "self.assertRaises(${1:Exception}, ${2:fun})" "assertRaises" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assertRaises" nil nil)
		       ("ane" "self.assertNotEqual($1, $2)" "assertNotEqual" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assertNotEqual" nil nil)
		       ("ai" "self.assertIn(${1:member}, ${2:container})" "assertIn" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assertIn" nil nil)
		       ("af" "self.assertFalse($0)" "assertFalse" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assertFalse" nil nil)
		       ("ae" "self.assertEqual($1, $2)" "assertEqual" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/assertEqual" nil nil)
		       ("ass" "assert $0" "assert" nil
			("testing")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/ass" nil nil)
		       ("arg" "parser.add_argument('${1:varname}', $0)" "arg_positional" nil
			("argparser")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/arg_positional" nil nil)
		       ("arg" "parser.add_argument('-$1', '--$2',\n                    $0)\n" "arg" nil
			("argparser")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/arg" nil nil)
		       ("a" "__all__ = [\n        $0\n]" "all" nil nil nil "/Users/cesco/.emacs.d/snippets/python-mode/all" nil nil)
		       ("setit" "def __setitem__(self, ${1:key}, ${2:val}):\n    $0" "__setitem__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__setitem__" nil nil)
		       ("new" "def __new__(mcs, name, bases, dict):\n    $0\n    return type.__new__(mcs, name, bases, dict)\n" "__new__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__new__" nil nil)
		       ("len" "def __len__(self):\n    $0" "__len__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__len__" nil nil)
		       ("getit" "def __getitem__(self, ${1:key}):\n    $0" "__getitem__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__getitem__" nil nil)
		       ("ex" "def __exit__(self, type, value, traceback):\n    $0" "__exit__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__exit__" nil nil)
		       ("ent" "def __enter__(self):\n    $0\n\n    return self" "__enter__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__enter__" nil nil)
		       ("cont" "def __contains__(self, el):\n    $0" "__contains__" nil
			("dunder methods")
			nil "/Users/cesco/.emacs.d/snippets/python-mode/__contains__" nil nil)))


;;; Do not edit! File generated at Mon May 22 13:01:31 2017
