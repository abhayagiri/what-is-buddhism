LATEX=lualatex
BIBTEX=bibtex
PANDOC=pandoc
PYTHON=python
TEXFILES=main.tex copyright.tex document.tex license.tex whatisbuddhism.cls

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: release

main-before-lettrinize.tex: main.md
	$(PANDOC) -o main-before-lettrinize.tex main.md

main.tex: main-before-lettrinize.tex lettrinize.py
	python lettrinize.py main-before-lettrinize.tex main.tex

booklet.pdf: $(TEXFILES) booklet.tex
	$(LATEX) $(LATEX_OPTS) booklet.tex

booklet-with-cover.pdf: booklet-with-cover.tex img/square-front.jpeg img/square-back.jpeg booklet.pdf
	$(LATEX) $(LATEX_OPTS) booklet-with-cover.tex

img/square-front.jpeg:
	make -C img square-front.jpeg

img/square-back.jpeg:
	make -C img square-back.jpeg

img/cover.pdf:
	make -C img cover.pdf

release: booklet.pdf booklet-with-cover.pdf img/cover.pdf
	mkdir -p release
	cp booklet-with-cover.pdf release/"What is Buddhism.pdf"
	cp booklet.pdf release/"What is Buddhism (Print Inside).pdf"
	cp img/cover.pdf release/"What is Buddhism (Print Cover).pdf"

view:
	open booklet.pdf
	open booklet-with-cover.pdf
	open img/cover.pdf

clean:
	make -C img clean
	rm -f *.aux *.log *.out *.pdf main.tex main-before-lettrinize.tex
	rm -f release/*.pdf
