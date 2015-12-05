FILE=book

LATEX=lualatex
BIBTEX=bibtex
PANDOC=pandoc

LATEX_OPTS=-interaction=nonstopmode -halt-on-error
PANDOC_OPTS=
#--chapters

all: book.pdf view

main.tex: main.md Makefile
	$(PANDOC) $(PANDOC_OPTS) -o main.tex main.md

book.pdf: main.tex front.tex copyright.tex book.tex whatisbuddhism.cls
	$(LATEX) $(LATEX_OPTS) $(FILE).tex

view:
	/cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Editor/PDFXEdit book.pdf &

clean:
	rm -f *.aux *.log main.tex book.pdf
