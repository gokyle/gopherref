TARG=gopherref
CHAPTERS=preamble.tex effective.tex spec.tex writing.tex title.tex credits.tex

$TARG.pdf::$TARG.tex $CHAPTERS
	xelatex $TARG.tex
	xelatex $TARG.tex

epub::$TARG.tex $CHAPTERS
        go run consolidate.go -i $TARG.tex -o ${TARG}_epub.tex
        pandoc -o $TARG.epub ${TARG}_epub.tex
        rm ${TARG}_epub.tex

clean:V:
	rm -f *.log *.aux *.out *.toc

nuke:V:clean
	rm -f *.pdf *.dvi *.toc *.epub
