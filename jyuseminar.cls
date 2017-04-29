\ProvidesClass{jyuseminar}[2017/05/01 University of Jyväskylä Seminar]
\NeedsTeXFormat{LaTeX2e}

\PassOptionsToPackage{intlimits, sumlimits}{amsmath}
\RequirePackage{amsmath}

\RequirePackage{etoolbox}
\newtoggle{jyumonochromatic}
\newtoggle{jyufinnished}
\DeclareOption{monochromatic}{\toggletrue{jyumonochromatic}}
\DeclareOption{finnished}{\toggletrue{jyufinnished}}
\DeclareOption*{\PassOptionsToClass \CurrentOption{beamer}}
\ProcessOptions*
\LoadClass{beamer}

\PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{inputenc}

\PassOptionsToPackage{T1}{fontenc}
\RequirePackage{fontenc}

\iftoggle{jyufinnished}
  {\PassOptionsToPackage{english, finnish}{babel}}
  {\PassOptionsToPackage{english}{babel}}
\RequirePackage{babel}
\addto \captionsfinnish{\renewcommand \refname{Lähteet}}
\addto \captionsfinnish{\renewcommand \figurename{Kuvio}}

\PassOptionsToPackage{yyyymmdd}{datetime}
\RequirePackage{datetime}
\renewcommand \dateseparator -

\RequirePackage{hyperref}

\RequirePackage{graphicx}

\RequirePackage{tikz}

\RequirePackage{xcolor}
\definecolor{jyutext}{RGB}{35, 31, 32}
\definecolor{jyuflame}{RGB}{242, 81, 27}
\definecolor{jyuhandle}{RGB}{36, 74, 165}

\PassOptionsToPackage{
  binary-units=true,
  exponent-product=\cdot,
  group-minimum-digits=3,
  per-mode=symbol-or-fraction,
  separate-uncertainty=true,
  version-1-compatibility}{siunitx}
\RequirePackage{siunitx}

\PassOptionsToPackage{
  backend=biber,
  date=iso8601, urldate=iso8601,
  firstinits=true, minnames=1, maxnames=3,
  sorting=none, style=numeric-comp}{biblatex}
\RequirePackage{biblatex}
\DefineBibliographyStrings{finnish}{
  candthesis={LuK-tutkielma},
  mathesis={pro gradu~-tutkielma},
  phdthesis={väitöskirja},
  references={Lähteet}}

\RequirePackage{csquotes}

\newcommand \makesetup{
  \mode<presentation>

  \iftoggle{jyufinnished}{
    \hypersetup{
      pdfauthor=\jyuauthorfinnish,
      pdftitle=\jyutitlefinnish,
      pdfsubject=\jyupublicationfinnish}

    \author \jyuauthorfinnish
    \title \jyutitlefinnish
    \subtitle \jyupublicationfinnish
    \institute{\jyuinstitutefinnish \\ \jyudepartmentfinnish}
    \date{\formatdate \jyuday \jyumonth \jyuyear}}{
    \hypersetup{
      pdfauthor=\jyuauthor,
      pdftitle=\jyutitle,
      pdfsubject=\jyupublication}

    \author \jyuauthor
    \title \jyutitle
    \subtitle \jyupublication
    \institute{\jyuinstitute \\ \jyudepartment}
    \date{\formatdate \jyuday \jyumonth \jyuyear}}

  \logo{
    \begin{tikzpicture}[every node/.style={inner sep=0pt, outer sep=0pt}]
      \node[
        anchor=south west,
        opacity=\ifnumequal \thepage 1{1.0}{0.25}] (image) {
        \iftoggle{jyumonochromatic}
            {\includegraphics[height=27mm]{jyu-tight-outline}}
            {\includegraphics[height=27mm]{jyu-tight}}};
    \end{tikzpicture}}

  \usecolortheme{dove}
  \usecolortheme{rose}
  \usecolortheme{seahorse}

  \iftoggle{jyumonochromatic}{}{
    \setbeamercolor{title}{fg=white, bg=jyuhandle}
    \setbeamercolor{titlelike}{fg=white, bg=jyuhandle}}}

\let \thephi \phi
\let \thevarphi \varphi
\let \theepsilon \epsilon
\let \thevarepsilon \varepsilon
\let \thekappa \kappa
\let \thevarkappa \varkappa
\let \phi \thevarphi
\let \varphi \thephi
\let \epsilon \thevarepsilon
\let \varepsilon \theepsilon
\let \kappa \thevarkappa
\let \varkappa \thekappa

\endinput