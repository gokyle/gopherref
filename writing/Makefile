PDFGEN := xelatex
VIEWER := open
SOURCE := writing

all: pdf view

pdf: ${SOURCE}.pdf

${SOURCE}.pdf: ${SOURCE}.tex
	$(PDFGEN) ${SOURCE}.tex

view: ${SOURCE}.pdf
	$(VIEWER) ${SOURCE}.pdf

clean:
	rm -rf *.log *.aux *.*\~

distclean:
	rm -f *.log *.aux *.*\~ *.backup
	rm -f *.pdf

.PHONY: all pdf clean


