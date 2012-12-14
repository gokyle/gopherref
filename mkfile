TARG=gopherref
CHAPTERS=preamble.tex effective.tex spec.tex writing.tex

$TARG.pdf::$TARG.tex $CHAPTERS
    xelatex $TARG.tex
    xelatex $TARG.tex

clean:V:
    rm -f *.log *.aux *.out

nuke:V:clean
    rm -f *.pdf *.dvi *.toc
