TARG=gopherref.pdf

$TARG:V:

%.pdf:  %.tex
#    latex $stem.tex
    xelatex $stem.tex

clean:V:
    rm -f *.log *.aux *.out

nuke:V:clean
    rm -f *.pdf *.dvi *.toc
