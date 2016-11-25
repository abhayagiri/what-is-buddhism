CONVERT=convert
# http://tex.stackexchange.com/questions/48101/how-do-i-make-sure-images-are-cmyk
# http://leftontheweb.com/blog/2015/02/25/Imagemagick_error_OSX/
CONVERT_OPTIONS=+profile '*' -profile AdobeRGB1998.icc \
	-profile USWebCoatedSWOP.icc -strip -sampling-factor 1x1 \
	-compress JPEG -quality 100 -units PixelsPerCentimeter -density 119.05x119.05

all: square-front.pdf square-back.pdf

clean:
	rm -f square-front.pdf square-back.pdf

square-front.pdf: square-front.xcf AdobeRGB1998.icc USWebCoatedSWOP.icc Makefile
	$(CONVERT) -layers merge square-front.xcf $(CONVERT_OPTIONS) square-front.pdf

square-back.pdf: square-back.xcf AdobeRGB1998.icc USWebCoatedSWOP.icc Makefile
	$(CONVERT) -layers merge square-back.xcf $(CONVERT_OPTIONS) square-back.pdf
