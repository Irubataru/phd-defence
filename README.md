# phd-defence
The presentation for my Ph.D. defence, Frankfurt, 25/11/16.

 * A pdf version of the talk can be found [here](https://github.com/Irubataru/phd-defence/releases/download/presented/presentation.pdf)
 * The corresponding thesis is also [available](https://github.com/Irubataru/phd-thesis)

## Compilation instructions

To compile the user requires xelatex and a fairly new version of pgf and pgfplots. The package also explicitly includes the 
Firefox [Fira font](https://github.com/mozilla/Fira), which must be available to xelatex on compilation.
This can however be disabled by editing the [definitions/plot_fonts.tex](definitions/plot_fonts.tex) (e.g. simply commenting out its contents).

The presentation used the [metropolis theme](https://github.com/matze/mtheme), which should be included in newer versions of TeX Live.

When all of these criterias are met, simply run `make` in the repository, and a pdf will be produced. The only thing missing from the
full presentation is the paper by Lüscher and Weisz referred to on slide 12. This has to be supplied by you if you have a pdf copy.
