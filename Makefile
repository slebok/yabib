ssh-user = softlang@linux.uni-koblenz.de
www-dir = /home/softlang/www

all:
	swipl -f src/main.pro
	pdflatex document
	bibtex document
	pdflatex document
	pdflatex document

upload:
	scp -r -p document.pdf ${ssh-user}:${www-dir}/yabib.pdf

