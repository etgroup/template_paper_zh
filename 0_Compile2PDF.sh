BASENAME=article
NAME=article.tex
xelatex $NAME
bibtex $BASENAME
makeglossaries $BASENAME
xelatex $NAME
xelatex $NAME
