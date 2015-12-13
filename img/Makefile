CONVERT=convert
# See http://tex.stackexchange.com/questions/48101/how-do-i-make-sure-images-are-cmyk
CONVERT_OPTIONS=+profile '*' -profile AdobeRGB1998.icc \
	-profile USWebCoatedSWOP.icc -strip -sampling-factor 1x1 \
	-compress JPEG -quality 100 -units PixelsPerInch -density 300x300

all: square-front.pdf square-back.pdf

clean:
	rm -f square-front.pdf square-back.pdf

square-front.pdf: square-front.xcf AdobeRGB1998.icc USWebCoatedSWOP.icc Makefile
	$(CONVERT) -layers merge square-front.xcf $(CONVERT_OPTIONS) square-front.pdf

square-back.pdf: square-back.xcf AdobeRGB1998.icc USWebCoatedSWOP.icc Makefile
	$(CONVERT) -layers merge square-back.xcf $(CONVERT_OPTIONS) square-back.pdf
 