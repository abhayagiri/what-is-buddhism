FILE=book

LATEX=lualatex
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: book

main.tex: main.md
	pandoc -o main.tex main.md

front.tex: front.md
	pandoc -o front.tex front.md

book: main.tex front.tex
	$(LATEX) $(LATEX_OPTS) $(FILE).tex;
