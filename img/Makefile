PDFLATEX = pdflatex
PDFLATEX_OPTS = -interaction=nonstopmode -halt-on-error

CONVERT = convert
CONVERT_DENSITY_OPTIONS = -units PixelsPerCentimeter -density 120x120
# http://tex.stackexchange.com/questions/48101/how-do-i-make-sure-images-are-cmyk
# http://leftontheweb.com/blog/2015/02/25/Imagemagick_error_OSX/
CONVERT_CMYK_OPTIONS = +profile '*' -profile AdobeRGB1998.icc \
	-profile USWebCoatedSWOP.icc -strip
CONVERT_JPEG_OPTIONS = -sampling-factor 1x1 -compress JPEG -quality 100

all: cover.pdf square-front.jpeg square-back.jpeg

clean:
	rm -f *.pdf *.png *.jpeg *.aux *.log

cover.jpeg: cover.xcf Makefile
	$(CONVERT) -layers merge cover.xcf \
		$(CONVERT_CMYK_OPTIONS) $(CONVERT_JPEG_OPTIONS) \
		$(CONVERT_DENSITY_OPTIONS) cover.jpeg

cover.pdf: cover.xcf Makefile
	$(CONVERT) -layers merge cover.xcf \
	  $(CONVERT_CMYK_OPTIONS)	$(CONVERT_JPEG_OPTIONS) \
	  $(CONVERT_DENSITY_OPTIONS) cover.pdf

square-front.jpeg: cover.jpeg Makefile
	$(CONVERT) -crop 1512x1512+1512+36 cover.jpeg \
		-quality 50 $(CONVERT_DENSITY_OPTIONS) square-front.jpeg

square-back.jpeg: cover.jpeg Makefile
	$(CONVERT) -crop 1512x1512+36+36 cover.jpeg \
		-quality 50 $(CONVERT_DENSITY_OPTIONS) square-back.jpeg

crop-bleed-marks.png: crop-bleed-marks.tex Makefile
	$(PDFLATEX) $(PDFLATEX_OPTS) crop-bleed-marks.tex
	$(CONVERT) -units PixelsPerCentimeter -density 120x120 crop-bleed-marks.pdf \
		-resize 3060x1584 crop-bleed-marks.png
