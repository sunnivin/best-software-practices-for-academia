LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf
LATEXMK_FIGOPT=-cd
LATEXMK_OUTPUT=-outdir
CONTINUOUS=-pvc

MAIN=main
FIGURES=figures/illustrations/*/*
SOURCES=$(MAIN).tex
FIGURE_SOURCES=$(FIGURES).tex
FIGURE_OUTPUT=$(LATEXMK_OUTPUT)=$(FIGURES)
ONE_FIG_OUTPUT = $(LATEXMK_OUTPUT)=$(FIG)

# all: figure $(MAIN).pdf		
all: $(MAIN).pdf

text: $(MAIN).pdf

figure:
	$(LATEXMK) $(LATEXMKOPT) $(LATEXMK_FIGOPT) \
	$(FIGURE_OUTPUT) $(FIGURE_SOURCES)
#	$(LATEXMK) $(LATEXMKOPT) $(LATEXMK_FIGOPT) $(FIGURE_SOURCES)


one_figure: $(FIG) .refresh $(FIG)
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) $(LATEXMK_FIGOPT) \
	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(FIGURE_OUTPUT) $(FIG)
#	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) $(LATEXMK_FIGOPT) \#$(ONE_FIG_OUTPUT)\


.refresh:
	touch .refresh

force:
	touch .refresh
	rm $(MAIN).pdf
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
	-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES)
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

#clean: clean_figures clean_text
clean: clean_text

clean_text:
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm -f *.a* 
	rm -f *.end 
	rm -f *.fls 
	rm -f *.log
	rm -f *.out 
	rm -f *.fdb_latexmk
	rm -f *.g*
	rm -f *.pdf
	rm -f *.ist
	rm -f *.tdo
	rm -f *.toc
	rm -f *.main.aux.swp
	rm -f *.nav
	rm -f *.snm
	rm -f *.b*
	rm -f *.run.*

clean_figures: $(FIGURES)
	rm -f $(FIGURES)*.pdfsync
	rm -f $(FIGURES)*.bbl 
	rm -f $(FIGURES)*.blg
	rm -f $(FIGURES)*.aux 
	rm -f $(FIGURES)*.end 
	rm -f $(FIGURES)*.fls 
	rm -f $(FIGURES)*.log
	rm -f $(FIGURES)*.out 
	rm -f $(FIGURES)*.fdb_latexmk
	rm -f $(FIGURES)*.gz
	rm -f $(FIGURES)*.pdf

once:
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

debug:
	$(LATEX) $(LATEXOPT) $(MAIN)

.PHONY: clean force once all





# #!/bin/bash
# LATEX=pdflatex
# LATEXOPT=--shell-escape
# NONSTOP=--interaction=nonstopmode

# LATEXMK=latexmk
# LATEXMKOPT=-pdf
# LATEXMK_FIGOPT=-cd
# LATEXMK_OUTPUT=-outdir
# CONTINUOUS=-pvc

# MAIN=main
# FIGURES=figures/illustrations/*/*
# SOURCES=$(MAIN).tex Makefile
# FIGURE_SOURCES=$(FIGURES).tex
# FIGURE_OUTPUT=$(LATEXMK_OUTPUT)=$(FIGURES)

# all: figure $(MAIN).pdf

# figure:
# 	$(LATEXMK) $(LATEXMKOPT) $(FIGURE_OUTPUT) $(LATEXMK_FIGOPT) \
# 	$(FIGURE_SOURCES)
# #	$(LATEXMK) $(LATEXMKOPT) $(LATEXMK_FIGOPT) $(FIGURE_SOURCES)


# one_figure: $(FIG) .refresh $(FIG)
# 	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) $(LATEXMK_FIGOPT) \
# 	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S"  $(FIGURE_OUTPUT) $(FIG)
# #$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) $(LATEXMK_FIGOPT) \#$(ONE_FIG_OUTPUT)\


# .refresh:
# 	touch .refresh

# $(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES)
# 	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
# 	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

# force:
# 	touch .refresh
# 	rm $(MAIN).pdf
# 	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
# 	-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

# clean: clean_figures clean_main

# clean_main:
# 	rm -f $(MAIN).pdfsync
# 	rm -rf *~ *.tmp
# 	rm -f *.bbl 
# 	rm -f *.blg
# 	rm -f *.a* 
# 	rm -f *.end 
# 	rm -f *.fls 
# 	rm -f *.log
# 	rm -f *.out 
# 	rm -f *.fdb_latexmk
# 	rm -f *.g*
# 	rm -f *.pdf
# 	rm -f *.ist
# 	rm -f *.tdo
# 	rm -f *.toc
# 	rm -f *.main.aux.swp

# clean_figures: $(FIGURES)
# 	rm -f $(FIGURES)*.pdfsync
# 	rm -f $(FIGURES)*.bbl 
# 	rm -f $(FIGURES)*.blg
# 	rm -f $(FIGURES)*.aux 
# 	rm -f $(FIGURES)*.end 
# 	rm -f $(FIGURES)*.fls 
# 	rm -f $(FIGURES)*.log
# 	rm -f $(FIGURES)*.out 
# 	rm -f $(FIGURES)*.fdb_latexmk
# 	rm -f $(FIGURES)*.gz
# 	rm -f $(FIGURES)*.pdf

# once:
# 	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

# debug:
# 	$(LATEX) $(LATEXOPT) $(MAIN)

# .PHONY: clean force once all


# # LATEX=pdflatex
# # LATEXOPT=--shell-escape
# # NONSTOP=--interaction=nonstopmode

 

# # LATEXMK=latexmk

# # LATEXMKOPT=-pdf

# # LATEXMK_FIGOPT=-cd

# # LATEXMK_OUTPUT=-outdir

# # CONTINUOUS=-pvc


# # MAIN=main
# # FIGURES=figures/illustrations/*/*
# # SOURCES=$(MAIN).tex Makefile
# # FIGURE_SOURCES=$(FIGURES).tex
# # FIGURE_OUTPUT=$(LATEXMK_OUTPUT)=$(FIGURES)

# # all: figure $(MAIN).pdf

# # figure:
# # 	$(LATEXMK) $(LATEXMKOPT) $(LATEXMK_FIGOPT) \
# # 	$(FIGURE_OUTPUT) $(FIGURE_SOURCES)
# # #	$(LATEXMK) $(LATEXMKOPT) $(LATEXMK_FIGOPT) $(FIGURE_SOURCES)


# # figures:
# # 	$(LATEXMK) $(LATEXMKOPT) $(LATEXMK_FIGOPT) $(FIGURE_SOURCES)  

# # .refresh:
# # 	touch .refresh

# # $(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES)
# # 	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
# # 	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

# # force:
# # 	touch .refresh
# # 	rm $(MAIN).pdf
# # 	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
# # 	-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

# # clean: clean_figures clean_main

# # clean_main:
# # 	rm -f $(MAIN).pdfsync
# # 	rm -rf *~ *.tmp
# # 	rm -f *.bbl 
# # 	rm -f *.blg
# # 	rm -f *.a* 
# # 	rm -f *.end 
# # 	rm -f *.fls 
# # 	rm -f *.log
# # 	rm -f *.out 
# # 	rm -f *.fdb_latexmk
# # 	rm -f *.g*
# # 	rm -f *.pdf
# # 	rm -f *.ist
# # 	rm -f *.tdo
# # 	rm -f *.toc
# # 	rm -f *.main.aux.swp

# # clean_figures: $(FIGURES)
# # 	rm -f $(FIGURES)*.pdfsync
# # 	rm -f $(FIGURES)*.bbl 
# # 	rm -f $(FIGURES)*.blg
# # 	rm -f $(FIGURES)*.aux 
# # 	rm -f $(FIGURES)*.end 
# # 	rm -f $(FIGURES)*.fls 
# # 	rm -f $(FIGURES)*.log
# # 	rm -f $(FIGURES)*.out 
# # 	rm -f $(FIGURES)*.fdb_latexmk
# # 	rm -f $(FIGURES)*.gz
# # 	rm -f $(FIGURES)*.pdf

# # once:
# # 	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

# # debug:
# # 	$(LATEX) $(LATEXOPT) $(MAIN)

# # .PHONY: clean force once all
