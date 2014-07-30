lighter_paper.pdf: lighter_paper.tex lighter_paper.bib
	latex lighter_paper
	bibtex lighter_paper
	latex lighter_paper
	bibtex lighter_paper
	latex lighter_paper
	dvipdf lighter_paper.dvi

lighter_paper_supp.pdf: lighter_paper_supp.tex lighter_paper_supp.bib
	latex lighter_paper_supp
	bibtex lighter_paper_supp
	latex lighter_paper_supp
	bibtex lighter_paper_supp
	latex lighter_paper_supp
	dvipdf lighter_paper_supp.dvi

.PHONY: clean
clean:
	rm -rf *.bbl *.blg *.log *.out *.pdf *.aux
