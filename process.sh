#!/bin/sh

OUT=${1-"effective_go.tex"}
if [ -e ${OUT} ]; then
        echo "[+] removing existing file ${OUT}"
        rm ${OUT}
fi

if [ ! -e ${OUT}.orig -o ! -s ${OUT}.orig ]; then
        echo "[+] generating original"
        pandoc -o ${OUT} /usr/local/Cellar/go/1.0.3/doc/${OUT%.tex}.html
        mv ${OUT} ${OUT}.orig
fi

sed     -e 's|\\subsection|\\section*|g'                                \
        -e 's|\\subsubsection|\\subsection*|g'                          \
        -e 's|\\begin{verbatim}|\\begin{Verbatim}[frame=single]|g'      \
        -e 's|\\end{verbatim}|\\end{Verbatim}|g'                        \
        -e 's|\\hyperref\[..*\]{\(..*\)}|\1|'                           \
        ${OUT}.orig > $OUT
