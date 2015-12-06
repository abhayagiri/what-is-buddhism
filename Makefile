FILE=book

LATEX=lualatex
BIBTEX=bibtex
PANDOC=pandoc
PYTHON=python

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: book.pdf view

main-before-lettrinize.tex: main.md
	$(PANDOC) -o main-before-lettrinize.tex main.md

main.tex: main-before-lettrinize.tex lettrinize.py
	python lettrinize.py main-before-lettrinize.tex main.tex

book.pdf: main.tex front.tex copyright.tex book.tex whatisbuddhism.cls
	$(LATEX) $(LATEX_OPTS) $(FILE).tex

view:
	/cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Editor/PDFXEdit book.pdf &

clean:
	rm -f *.aux *.log main.tex main-before-lettrinize.tex book.pdf
