\ProvidesClass{jyuthesis}[2017/05/01 University of Jyväskylä Thesis]
\NeedsTeXFormat{LaTeX2e}

\PassOptionsToPackage{intlimits, sumlimits}{amsmath}
\RequirePackage{amsmath}

\RequirePackage{etoolbox}
\newtoggle{jyumonochromatic}
\newtoggle{jyufinnished}
\DeclareOption{monochromatic}{\toggletrue{jyumonochromatic}}
\DeclareOption{finnished}{\toggletrue{jyufinnished}}
\PassOptionsToClass{12pt, a4paper, titlepage, twoside}{article}
\DeclareOption*{\PassOptionsToClass \CurrentOption{article}}
\ProcessOptions*
\LoadClass{article}

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

\RequirePackage{booktabs}

\RequirePackage{lmodern}
\linespread{1.3}

\PassOptionsToPackage{
  a4paper, bindingoffset=10mm, headheight=18pt,
  bottom=35mm, left=25mm, right=25mm, top=35mm}{geometry}
\RequirePackage{geometry}

\RequirePackage{fancyhdr}
\fancypagestyle{headpage}{
  \fancyhf{}
  \renewcommand \headrulewidth{0pt}
  \renewcommand \footrulewidth{0pt}}
\fancypagestyle{tailpage}{
  \fancyhf{}
  \fancyhead[LE, RO] \thepage
  \renewcommand \headrulewidth{0pt}
  \renewcommand \footrulewidth{0pt}}
\AtBeginDocument{\thispagestyle{headpage}}
\pagestyle{tailpage}

\PassOptionsToPackage{nobottomtitles, noindentafter, toctitles}{titlesec}
\RequirePackage{titlesec}
\newcommand \sectionbreak{\cleardoublepage\vspace*{24pt}}

\PassOptionsToPackage{nottoc}{tocbibind}
\RequirePackage{tocbibind}

\PassOptionsToPackage{margin=12pt}{caption}
\RequirePackage{caption}

\RequirePackage{microtype}

\newcommand \makesetup{
  \iftoggle{jyufinnished}{
    \hypersetup{
      pdfauthor=\jyuauthorfinnish,
      pdftitle=\jyutitlefinnish,
      pdfsubject=\jyupublicationfinnish}}{
    \hypersetup{
      pdfauthor=\jyuauthor,
      pdftitle=\jyutitle,
      pdfsubject=\jyupublication}}}

\renewcommand \maketitle{
  \begin{titlepage}
    \noindent\hspace*{0.1\textwidth}\rule{0.8pt}
    \textheight\hspace*{0.05\textwidth}\parbox[b]{0.84\textwidth}{
      \raggedright
      \textbf{\LARGE\iftoggle{jyufinnished}
        \jyutitlefinnish \jyutitle} \\[0.05\textheight]
      \textrm{\large\iftoggle{jyufinnished}
        \jyupublicationfinnish \jyupublication,
        \formatdate \jyuday \jyumonth \jyuyear} \\[0.1\textheight]
      \iftoggle{jyufinnished}
        {Tekijä}{Author}: \\[0.01\textheight]
        \textsc{\large\iftoggle{jyufinnished}
        \jyuauthorfinnish \jyuauthor} \\[0.05\textheight]
        \iftoggle{jyufinnished}
        {Ohjaaja}{Supervisor}: \\[0.01\textheight]
        \textsc{\large\iftoggle{jyufinnished}
        \jyusupervisorfinnish \jyusupervisor} \\[0.2\textheight]
      \begin{tikzpicture}[every node/.style={inner sep=0pt, outer sep=0pt}]
        \node[anchor=south west] (image) {
          \iftoggle{jyumonochromatic}
          {\includegraphics[height=27mm]{jyu-tight-outline}}
          {\includegraphics[height=27mm]{jyu-tight}}};
        \begin{scope}[x=1mm, y=1mm]
          \node[align=left, anchor=north west] at (10, 11) {
            \fontfamily{ppl}\selectfont
            \iftoggle{jyufinnished}{\MakeUppercase
              \jyuinstitutefinnish \\ \MakeUppercase
              \jyudepartmentfinnish}{\MakeUppercase
              \jyuinstitute \\ \MakeUppercase
              \jyudepartment}};
        \end{scope}
      \end{tikzpicture}}
  \end{titlepage}}

\newcommand \appendixsection[1]{
  \clearpage
  \section{#1}
  \pagenumbering{arabic}
  \renewcommand \thepage{\thesection--\arabic{page}}}

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
