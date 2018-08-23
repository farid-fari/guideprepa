MDTTARGS=-p hyperref,lmodern,textcomp -a "Farid Arthaud" -l french --toc --nomargin
MDTTLOCA=/home/farid/source/mdtotex/mdtotex.py
SHELL=/bin/zsh

all: sujets.pdf guide.pdf

view:
	zathura guide.pdf
	zathura sujets.pdf

%.pdf: %.tex
	latexmk --pdf $(<F)

%.tex: %.md
	rm $(@F)
	python $(MDTTLOCA) $(MDTTARGS) $(<F)

clean:
	rm *.aux *.log *.fls *.fdb_latexmk
