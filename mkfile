TARG=gopherref
CHAPTERS=preamble.tex effective.tex spec.tex writing.tex title.tex credits.tex

$TARG.pdf::$TARG.tex $CHAPTERS
	xelatex $TARG.tex
	xelatex $TARG.tex

epub::$TARG.tex $CHAPTERS
	pandoc --standalone -o $TARG.epub $TARG.tex

clean:V:
	rm -f *.log *.aux *.out *.toc

nuke:V:clean
	rm -f *.pdf *.dvi *.toc
