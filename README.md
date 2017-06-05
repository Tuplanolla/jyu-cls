# University of Jyväskylä Document Classes

These LaTeX document classes are intended to provide a basis
for the publications of students and staff of the University of Jyväskylä.
It was originally written by Sampsa "Tuplanolla" Kiiskinen
to support his technical reports, theses and seminars.
The classes and their examples are released under the GNU GPL, which means that
documents built using the class must be accompanied by their source code.
The assets (namely the logos) are released according to
[the terms and conditions (Finnish)][assets]
imposed by the University of Jyväskylä.

Note that although these document classes produce documents
that look similar to those produced by the official templates,
they are built on completely different foundations.
These classes are also much easier to use and
get all the technical details right,
which shows in their handling of vector graphics, date formatting,
text alignment, file organization and more.

## Installation

Installing the document classes involves copying their files
into the appropriate locations in the TeX Directory Structure.
To make this process easier, a Bourne shell script is provided.

Run the following command to see how the classes should be installed.

    $ ./install help

If the installation directory is not satisfying,
it can be changed by setting the `TEXMF` environment variable.

    $ TEXMF=/usr/local/share ./install help

To actually install the classes, follow the printed instructions or
run either of the following commands to perform the actions automatically.
The former copies the files directly to their destinations while
the latter only creates absolute symbolic links
to the installation files in the current directory and
places them inside the destination directories.

    $ ./install copy
    $ ./install link

## Usage

Run the following commands to build an example document
that uses the thesis document class.

    $ pdflatex thesis.tex
    $ biber thesis
    $ pdflatex thesis.tex
    $ pdflatex thesis.tex

Substitute `thesis` for `seminar` to build another example document
that uses the seminar document class.

## Asset Colors

The colors of the assets do not exactly match their specification.
It does not really matter whether this is due to Pantone's terrible standards,
graphic designers' incompetence or bugs in the software rendering pipeline.
The only consistent workaround is to match the colors manually.

The following table summarizes the colors
according to the written specification.

| Part   | PMS             | Hex    | RGB        | CMYK
|:-------|:----------------|:-------|:-----------|:---------------
| Text   | [Black C][text] | 2d2926 | 45, 41, 38 | 63, 62, 59, 94
| Flame  | [166 C][flame]  | e35205 | 227, 82, 5 | 0, 76, 100, 0
| Handle | [286 C][handle] | 0033a0 | 0, 51, 160 | 100, 75, 0, 0

The following table summarizes the actual colors
rendered by Ghostscript 9.18.

| Part   | Hex    | RGB
|:-------|:-------|:------------
| Text   | 231f20 | 35, 31, 32
| Flame  | f2511b | 242, 81, 27
| Handle | 244aa5 | 36, 74, 165

## Beamer Themes

For low contrast pick the following combination.

    \usecolortheme{dove} % complete
    \usecolortheme{rose} % inner
    \usecolortheme{seahorse} % outer

For high contrast pick the following combination.

    \usecolortheme{dove} % complete
    \usecolortheme{orchid} % inner
    \usecolortheme{whale} % outer

## Changes to Mathematics

The following Greek letters are swapped with their variants.

    \phi \epsilon \kappa

The missing trigonometric functions needed
to complete the following table are also defined.

    \cos \cosh \arccos \arcosh
    \sin \sinh \arcsin \arsinh
    \tan \tanh \arctan \artanh
    \sec \sech \arcsec \arsech
    \csc \csch \arccsc \arcsch
    \cot \coth \arccot \arcoth

## Minimal Preambles

There is a minimal preamble that defines
only those things that do not use any packages.
It can be used with systems
that only implement a small subset of LaTeX's features.
For example Asymptote can use it as follows.

    texpreamble("\input{jyupreamble}");

There is another slightly bigger preamble
that requires the `amsmath` package.
Using Asymptote as an example again, it can be used as follows.

    usepackage("amsmath");
    texpreamble("\input{jyuamspreamble}");

[assets]: https://www.jyu.fi/yliopistopalvelut/viestinta/logot
[text]: https://www.pantone.com/color-finder/Black-C
[flame]: https://www.pantone.com/color-finder/166-C
[handle]: https://www.pantone.com/color-finder/286-C
