BASENAME=article_zh
NAME=article_zh.tex
pdflatex $NAME
bibtex $BASENAME
makeglossaries $BASENAME
pdflatex $NAME
pdflatex $NAME
