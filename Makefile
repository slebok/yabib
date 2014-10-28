ssh-user = softlang@linux.uni-koblenz.de
www-dir = /home/softlang/www

all:
	make generate
	make compile

compile:
	pdflatex document
	bibtex document
	pdflatex document
	pdflatex document

generate:
	swipl -f src/main.pro

upload:
	scp -r -p document.pdf ${ssh-user}:${www-dir}/yabib.pdf

