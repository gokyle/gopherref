PDFGEN := xelatex
VIEWER := open
SOURCE := gopherref
CHAPTERS := spec.tex writing.tex effective.tex

all: pdf view

pdf: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex $(CHAPTERS)
	xelatex $(SOURCE).tex
	$(PDFGEN) $(SOURCE).tex

view: $(SOURCE).pdf
	$(VIEWER) $(SOURCE).pdf

clean:
	rm -rf *.log *.aux *.*\~ *.toc *.out

distclean: clean
	rm -f *.pdf *.epub

.PHONY: all pdf clean


