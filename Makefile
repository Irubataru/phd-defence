LATEXMK  := latexmk
LATEX    := xelatex

MAINTEX  := presentation.tex
MAINPDF  := $(MAINTEX:.tex=.pdf)

GRAPHMAT := figures/graphs/graphmatrix.tex
GRAPHPDF := $(GRAPHMAT:.tex=.pdf)

FIGDIR   := figures
FIGTEX   := $(filter-out $(GRAPHMAT),$(wildcard $(FIGDIR)/*.tex) $(wildcard $(FIGDIR)/graphs/*.tex))
FIGPDF   := $(FIGTEX:.tex=.pdf)

PLOTDIR  := plots
PLOTTEX  := $(wildcard $(PLOTDIR)/section_*/*.tex)
PLOTPDF  := $(PLOTTEX:.tex=.pdf)

STYLETEX := $(wildcard definitions/*.tex)

AUXTEX   := $(filter-out $(MAINTEX) $(FIGTEX),$(wildcard **/*.tex))

cd_and_clean = cd $(dir $(realpath $(1))); $(LATEXMK) -C $(notdir $(1))

.PHONY: clean cleanthesis

$(MAINPDF) : $(AUXTEX) $(MAINTEX) $(STYLETEX) $(FIGPDF) $(PLOTPDF) $(GRAPHPDF)
	$(LATEXMK) -pdf $(MAINTEX)

$(GRAPHPDF): %.pdf: %.tex | $(STYLETEX) $(FIGPDF)
	cd $(dir $<); \
	$(LATEX) $(notdir $<)

$(FIGPDF): %.pdf: %.tex | $(STYLETEX)
	cd $(dir $<); \
	$(LATEX) $(notdir $<)

$(PLOTPDF): %.pdf: %.tex | $(STYLETEX)
	cd $(dir $<); \
	$(LATEXMK) -pdf $(notdir $<)

clean: $(MAINTEX) $(FIGTEX) $(PLOTTEX)
	$(foreach file, $^, $(call cd_and_clean,$(file));)

cleanthesis: $(MAINTEX)
	$(LATEXMK) -C $(MAINTEX)
