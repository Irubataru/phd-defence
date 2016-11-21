LATEXMK  := latexmk
LATEX    := xelatex

MAINTEX  := presentation.tex
MAINPDF  := $(MAINTEX:.tex=.pdf)

#FIGDIR   := figures
#FIGTEX   := $(wildcard $(FIGDIR)/chapter_*/*.tex)
#FIGPDF   := $(FIGTEX:.tex=.pdf)

#PLOTDIR  := plots
#PLOTTEX  := $(wildcard $(PLOTDIR)/chapter_*/*.tex) $(wildcard $(PLOTDIR)/appendix_*/*.tex) \
						#$(wildcard $(PLOTDIR)/chapter_*/section_*/*.tex)
#PLOTPDF  := $(PLOTTEX:.tex=.pdf)

STYLETEX := $(wildcard definitions/*.tex)

AUXTEX   := $(filter-out $(MAINTEX) $(FIGTEX),$(wildcard **/*.tex))

cd_and_clean = cd $(dir $(realpath $(1))); $(LATEXMK) -C $(notdir $(1))

.PHONY: clean cleanthesis

$(MAINPDF) : $(AUXTEX) $(MAINTEX) $(STYLETEX) $(FIGPDF) $(PLOTPDF) $(BMTRPDF)
	$(LATEXMK) -pdf $(MAINTEX)

#$(FIGPDF): %.pdf: %.tex | $(STYLETEX)
	#cd $(dir $<); \
	#$(LATEX) $(notdir $<)

#$(PLOTPDF): %.pdf: %.tex | $(STYLETEX)
	#cd $(dir $<); \
	#$(LATEXMK) -C $(notdir $<); \
	#$(LATEXMK) -pdf $(notdir $<)

#$(BMTRPDF): %.pdf: %.tex
	#cd $(dir $<); \
	#$(LATEX) $(notdir $<)

clean: $(MAINTEX) $(FIGTEX)
	$(foreach file, $^, $(call cd_and_clean,$(file));)

cleanthesis: $(MAINTEX)
	$(LATEXMK) -C $(MAINTEX)
