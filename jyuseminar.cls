\ProvidesClass{jyuseminar}[2017/05/24 University of Jyväskylä Seminar]
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
  {\PassOptionsToPackage{finnish, english}{babel}}
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
  \edef \jyuauthorx{\iftoggle{jyufinnished} \jyuauthorfinnish \jyuauthor}
  \edef \jyutitlex{\iftoggle{jyufinnished} \jyutitlefinnish \jyutitle}
  \edef \jyupublicationx{\iftoggle{jyufinnished} \jyupublicationfinnish \jyupublication}
  \edef \jyusupervisorx{\iftoggle{jyufinnished} \jyusupervisorfinnish \jyusupervisor}
  \edef \jyuinstitutex{\iftoggle{jyufinnished} \jyuinstitutefinnish \jyuinstitute}
  \edef \jyudepartmentx{\iftoggle{jyufinnished} \jyudepartmentfinnish \jyudepartment}

  \hypersetup{
    pdfauthor=\jyuauthorx,
    pdftitle=\jyutitlex,
    pdfsubject=\jyupublicationx}

  \mode<presentation>

  \author \jyuauthorx
  \title \jyutitlex
  \subtitle \jyupublicationx
  \institute{\jyuinstitutex \\ \jyudepartmentx}
  \date{\formatdate \jyuday \jyumonth \jyuyear}

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

\input{jyupreamble}

\endinput
