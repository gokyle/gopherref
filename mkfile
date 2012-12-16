TARG=gopherref
CHAPTERS=preamble.tex           \
         title.tex              \
         writing.tex            \
         effective.tex          \
         error_handling.tex     \
         defer.tex              \
         concurrency.tex        \
         gobs.tex               \
         spec.tex               \
         credits.tex

all:V:pdf epub

pdf:V:$TARG.pdf

# some of the image and TOC stuff in LaTeX works best when you process the
# file twice.
$TARG.pdf::$TARG.tex $CHAPTERS
	xelatex $TARG.tex
	xelatex $TARG.tex

epub:V:$TARG.epub

$TARG.epub::$TARG.tex $CHAPTERS
        go run consolidate.go -i $TARG.tex -o ${TARG}_epub.tex
        pandoc --toc --epub-cover-image=cover.png       \
                --epub-metadata=epub_metadata.xml -o    \
                $TARG.epub ${TARG}_epub.tex
        rm ${TARG}_epub.tex

# this is for OS X
view:V:$TARG.pdf
        open $TARG.pdf

clean:V:
	rm -f *.log *.aux *.out *.toc

nuke:V:clean
	rm -f *.pdf *.dvi *.epub
