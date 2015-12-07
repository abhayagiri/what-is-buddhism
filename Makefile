LATEX=lualatex
BIBTEX=bibtex
PANDOC=pandoc
PYTHON=python
TEXFILES=main.tex front.tex copyright.tex whatisbuddhism.cls

LATEX_OPTS=-interaction=nonstopmode -halt-on-error
CONVERT_OPTS=-resize '1425x1425^' -gravity center -extent '1425x1425' \
	-units PixelsPerInch -density 300x300 -compress JPEG

all: short-booklet-with-cover.pdf normal-booklet-with-cover.pdf view

main-before-lettrinize.tex: main.md
	$(PANDOC) -o main-before-lettrinize.tex main.md

main.tex: main-before-lettrinize.tex lettrinize.py
	python lettrinize.py main-before-lettrinize.tex main.tex

short-booklet.pdf: $(TEXFILES) short-booklet.tex
	$(LATEX) $(LATEX_OPTS) short-booklet.tex

normal-booklet.pdf: $(TEXFILES) normal-booklet.tex
	$(LATEX) $(LATEX_OPTS) normal-booklet.tex

short-booklet-with-cover.pdf: short-booklet-with-cover.tex img/booklet-front.pdf img/booklet-back.pdf short-booklet.pdf
	$(LATEX) $(LATEX_OPTS) short-booklet-with-cover.tex

normal-booklet-with-cover.pdf: normal-booklet-with-cover.tex img/booklet-front.pdf img/booklet-back.pdf normal-booklet.pdf
	$(LATEX) $(LATEX_OPTS) normal-booklet-with-cover.tex

img/booklet-front.pdf: img/booklet-front.png
	$(CONVERT) img/booklet-front.png $(CONVERT_OPTS) img/booklet-front.pdf

img/booklet-back.pdf: img/booklet-back.png
	$(CONVERT) img/booklet-back.png $(CONVERT_OPTS) img/booklet-back.pdf

view:
	/cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Editor/PDFXEdit \
		short-booklet-with-cover.pdf normal-booklet-with-cover.pdf &

clean:
	rm -f *.aux *.log *.out *.pdf main.tex main-before-lettrinize.tex
