clear:
	rm  src/vim/vim/plugins/vim-devicons/doc/tags

push:
	git add --all && git commit -m "$(shell date)" && git push --set-upstream origin master
