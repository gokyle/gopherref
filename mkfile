TARG=gopherref

$TARG.pdf::$TARG.tex
    xelatex $TARG.tex

clean:V:
    rm -f *.log *.aux *.out

nuke:V:clean
    rm -f *.pdf *.dvi *.toc
