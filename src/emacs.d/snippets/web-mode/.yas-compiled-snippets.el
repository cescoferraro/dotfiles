;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
		     '(("withstyles" "import withStyles from 'isomorphic-style-loader/lib/withStyles';" "withstyles" nil nil nil "/Users/cesco/.emacs.d/snippets/web-mode/withstyles" nil nil)
		       ("redux.reducer" "export const $0 = (state = [], action) => {\n    switch (action.type) {\n        default:\n            return state\n    }\n}" "redux-reducer" nil nil nil "/Users/cesco/.emacs.d/snippets/web-mode/redux.reducer" nil nil)
		       ("redux.action" "\nexport const $1_ACTION_NAME = \"$1\";\n\nexport function $1_ACTION($2:$0): Action<any> {\n    return {\n        type: $1_ACTION_NAME,\n        payload: $2\n    }\n}\n" "redux-action" nil nil nil "/Users/cesco/.emacs.d/snippets/web-mode/redux.action" nil nil)
		       ("react" "import * as React from \"react\";\n\n\nexport const $1 = ({$2}) => {\n       return $0\n}\n" "react" nil nil nil "/Users/cesco/.emacs.d/snippets/web-mode/react" nil nil)
		       ("group" ",\n{\n	name: \"$4\",\n	code: \"$3\",\n	children: [\n		  {name: \"$1\", code: \"$0\"}\n	]\n}" "group" nil nil nil "/Users/cesco/.emacs.d/snippets/web-mode/group" nil nil)))


;;; Do not edit! File generated at Mon May 22 13:01:31 2017
