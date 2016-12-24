# University of Jyväskylä LaTeX Document Class

This LaTeX document class is intended to provide a basis
for the publications of students and staff of the University of Jyväskylä.
It was originally written by Sampsa "Tuplanolla" Kiiskinen
to support his technical reports and theses.
The class and its examples are released under the GNU GPL, which means that
documents built using the class must be accompanied by their source code.
The assets (namely the logos) are released according to
[the terms and conditions (Finnish)][assets]
imposed by the University of Jyväskylä.

Note that although this document class produces documents
that look similar to those produced by the official template,
it is built on completely different foundations.
This class is also much easier to use and gets all the technical details right,
which shows in its handling of vector graphics, date formatting,
text alignment, file organization and more.

## Installation

Installing this document class involves copying its files
to the appropriate locations in the TeX Directory Structure.
To make this process easier, a Bourne shell script is provided.

Run the following command to see how the class should be installed.

    $ ./install help

If the installation directory is not satisfying,
it can be changed by setting the `TEXMF` environment variable.

    $ TEXMF=/usr/local/share ./install help

To actually install the class, follow the printed instructions or
run either of the following commands to perform the actions automatically.
The former copies the files directly to their destinations while
the latter only creates absolute symbolic links
to the installation files in the current directory and
places them inside the destination directories.

    $ ./install copy
    $ ./install link

## Usage

Run the following commands to build an example document
that uses the document class like a thesis would.

    $ pdflatex thesis.tex
    $ biber thesis
    $ pdflatex thesis.tex
    $ pdflatex thesis.tex

[assets]: https://www.jyu.fi/yliopistopalvelut/viestinta/logot
