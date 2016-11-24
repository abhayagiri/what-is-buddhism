LATEX=lualatex
BIBTEX=bibtex
PANDOC=pandoc
PYTHON=python
TEXFILES=main.tex copyright.tex document.tex license.tex whatisbuddhism.cls

LATEX_OPTS=-interaction=nonstopmode -halt-on-error
CONVERT_OPTS=-resize '1425x1425^' -gravity center -extent '1425x1425' \
	-units PixelsPerInch -density 300x300 -compress JPEG

all: booklet.pdf booklet-with-cover.pdf cover-only.pdf

main-before-lettrinize.tex: main.md
	$(PANDOC) -o main-before-lettrinize.tex main.md

main.tex: main-before-lettrinize.tex lettrinize.py
	python lettrinize.py main-before-lettrinize.tex main.tex

booklet.pdf: $(TEXFILES) booklet.tex
	$(LATEX) $(LATEX_OPTS) booklet.tex

booklet-with-cover.pdf: booklet-with-cover.tex img/square-front.pdf img/square-back.pdf booklet.pdf
	$(LATEX) $(LATEX_OPTS) booklet-with-cover.tex

cover-only.pdf: $(TEXFILES) cover-only.tex img/square-front.pdf img/square-back.pdf
	$(LATEX) $(LATEX_OPTS) cover-only.tex

img/square-front.pdf:
	make -C img square-front.pdf

img/square-back.pdf:
	make -C img square-back.pdf

view:
	open booklet.pdf
	open booklet-with-cover.pdf
	open cover-only.pdf

clean:
	make -C img clean
	rm -f *.aux *.log *.out *.pdf main.tex main-before-lettrinize.tex
