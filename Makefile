PDFGEN := xelatex
VIEWER := open
SOURCE := gopherref
CHAPTERS := spec.pdf writing.pdf

all: pdf view

pdf: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex $(CHAPTERS)
	xelatex $(SOURCE).tex
	$(PDFGEN) $(SOURCE).tex

view: $(SOURCE).pdf
	$(VIEWER) $(SOURCE).pdf

spec.pdf: spec.tex
	xelatex spec.tex

writing.pdf: writing.tex
	xelatex writing.tex

clean:
	rm -rf *.log *.aux *.*\~ *.toc *.out

distclean: clean
	rm -f *.pdf *.epub

.PHONY: all pdf clean


