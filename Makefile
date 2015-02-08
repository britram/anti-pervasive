NAME=draft-iab-privsec-confidentiality-threat-03
MD=kramdown-rfc2629
X2R=xml2rfc
CF=cupsfilter

all: txt html pdf
txt: $(NAME).txt
html: $(NAME).html
pdf: $(NAME).pdf
clean:
	if [ -e $(NAME).xml  ]; then rm $(NAME).xml ; fi
	if [ -e $(NAME).txt  ]; then rm $(NAME).txt ; fi
	if [ -e $(NAME).html ]; then rm $(NAME).html; fi
	if [ -e $(NAME).pdf  ]; then rm $(NAME).pdf ; fi

$(NAME).pdf: $(NAME).txt
	$(CF) $(NAME).txt >$(NAME).pdf

$(NAME).txt: $(NAME).xml
	$(X2R) $(NAME).xml $(NAME).txt

$(NAME).html: $(NAME).xml
	$(X2R) $(NAME).xml $(NAME).html

$(NAME).xml: $(NAME).md
	$(MD) <$(NAME).md | sed -e 's/xml.resource.org/xml2rfc.ietf.org/g' >$(NAME).xml
