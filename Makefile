PDFGEN := xelatex
VIEWER := open
SOURCE := gopherref
CHAPTERS := preamble.tex spec.tex writing.tex effective.tex title.tex credits.tex

all: pdf view

pdf: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex $(CHAPTERS)
	xelatex $(SOURCE).tex
	xelatex $(SOURCE).tex
	$(PDFGEN) $(SOURCE).tex

view: $(SOURCE).pdf
	$(VIEWER) $(SOURCE).pdf

clean:
	rm -rf *.log *.aux *.*\~ *.toc *.out

distclean: clean
	rm -f *.pdf *.epub

.PHONY: all pdf clean


