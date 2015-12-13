LATEX=lualatex
BIBTEX=bibtex
PANDOC=pandoc
PYTHON=python
TEXFILES=main.tex front.tex copyright.tex document.tex whatisbuddhism.cls

LATEX_OPTS=-interaction=nonstopmode -halt-on-error
CONVERT_OPTS=-resize '1425x1425^' -gravity center -extent '1425x1425' \
	-units PixelsPerInch -density 300x300 -compress JPEG

#all: short-booklet-with-cover.pdf normal-booklet-with-cover.pdf view
all: short-booklet.pdf normal-booklet.pdf spaced-booklet.pdf view

main-before-lettrinize.tex: main.md
	$(PANDOC) -o main-before-lettrinize.tex main.md

main.tex: main-before-lettrinize.tex lettrinize.py
	python lettrinize.py main-before-lettrinize.tex main.tex

short-booklet.pdf: $(TEXFILES) short-booklet.tex
	$(LATEX) $(LATEX_OPTS) short-booklet.tex

normal-booklet.pdf: $(TEXFILES) normal-booklet.tex
	$(LATEX) $(LATEX_OPTS) normal-booklet.tex

spaced-booklet.pdf: $(TEXFILES) spaced-booklet.tex
	$(LATEX) $(LATEX_OPTS) spaced-booklet.tex

short-booklet-with-cover.pdf: short-booklet-with-cover.tex img/booklet-front.pdf img/booklet-back.pdf short-booklet.pdf
	$(LATEX) $(LATEX_OPTS) short-booklet-with-cover.tex

normal-booklet-with-cover.pdf: normal-booklet-with-cover.tex img/booklet-front.pdf img/booklet-back.pdf normal-booklet.pdf
	$(LATEX) $(LATEX_OPTS) normal-booklet-with-cover.tex

spaced-booklet-with-cover.pdf: spaced-booklet-with-cover.tex spaced-booklet.pdf
	$(LATEX) $(LATEX_OPTS) spaced-booklet-with-cover.tex

short-booklet-print-draft.pdf: short-booklet.pdf short-booklet-print-draft.tex
	$(LATEX) $(LATEX_OPTS) short-booklet-print-draft.tex

normal-booklet-print-draft.pdf: normal-booklet.pdf normal-booklet-print-draft.tex
	$(LATEX) $(LATEX_OPTS) normal-booklet-print-draft.tex

spaced-booklet-print-draft.pdf: spaced-booklet.pdf spaced-booklet-print-draft.tex
	$(LATEX) $(LATEX_OPTS) spaced-booklet-print-draft.tex

view:
	/cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Editor/PDFXEdit \
		short-booklet.pdf normal-booklet.pdf &
#		short-booklet-with-cover.pdf normal-booklet-with-cover.pdf &

clean:
	rm -f *.aux *.log *.out *.pdf main.tex main-before-lettrinize.tex
