\ProvidesClass{jyuthesis}[2017/05/24 University of Jyväskylä Thesis]
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
  \edef \jyuauthorx{\iftoggle{jyufinnished} \jyuauthorfinnish \jyuauthor}
  \edef \jyutitlex{\iftoggle{jyufinnished} \jyutitlefinnish \jyutitle}
  \edef \jyupublicationx{\iftoggle{jyufinnished} \jyupublicationfinnish \jyupublication}
  \edef \jyusupervisorx{\iftoggle{jyufinnished} \jyusupervisorfinnish \jyusupervisor}
  \edef \jyuinstitutex{\iftoggle{jyufinnished} \jyuinstitutefinnish \jyuinstitute}
  \edef \jyudepartmentx{\iftoggle{jyufinnished} \jyudepartmentfinnish \jyudepartment}

  \hypersetup{
    pdfauthor=\jyuauthorx,
    pdftitle=\jyutitlex,
    pdfsubject=\jyupublicationx}}

\renewcommand \maketitle{
  \begin{titlepage}
    \noindent\hspace*{0.1\textwidth}\rule{0.8pt}
    \textheight\hspace*{0.05\textwidth}\parbox[b]{0.84\textwidth}{
      \raggedright
      \textbf{\LARGE\jyutitlex} \\[0.05\textheight]
      \textrm{\large\jyupublicationx,
        \formatdate \jyuday \jyumonth \jyuyear} \\[0.1\textheight]
      \newcounter{jyuauthorcounter}
      \setcounter{jyuauthorcounter} 0
      \renewcommand* \do[1]{\stepcounter{jyuauthorcounter}}
      \expandafter\docsvlist\expandafter{\jyuauthorx}
      \iftoggle{jyufinnished}{
        \ifnumcomp{\value{jyuauthorcounter}} = 1
        {Tekijä}{Tekijät}}{
        \ifnumcomp{\value{jyuauthorcounter}} = 1
        {Author}{Authors}}: \\[0.01\textheight]
      \setcounter{jyuauthorcounter} 0
      \renewcommand* \do[1]{\stepcounter{jyuauthorcounter}
        \ifnumcomp{\value{jyuauthorcounter}} > 1
        {\\}{}
        \textsc{\large ##1}}
      \expandafter\docsvlist\expandafter{\jyuauthorx} \\[0.05\textheight]
      \newcounter{jyusupervisorcounter}
      \setcounter{jyusupervisorcounter} 0
      \renewcommand* \do[1]{\stepcounter{jyusupervisorcounter}}
      \expandafter\docsvlist\expandafter{\jyusupervisorx}
      \iftoggle{jyufinnished}{
        \ifnumcomp{\value{jyusupervisorcounter}} = 1
        {Ohjaaja}{Ohjaajat}}{
        \ifnumcomp{\value{jyusupervisorcounter}} = 1
        {Supervisor}{Supervisors}}: \\[0.01\textheight]
      \setcounter{jyusupervisorcounter} 0
      \renewcommand* \do[1]{\stepcounter{jyusupervisorcounter}
        \ifnumcomp{\value{jyusupervisorcounter}} > 1
        {\\}{}
        \textsc{\large ##1}}
      \expandafter\docsvlist\expandafter{\jyusupervisorx} \\[0.2\textheight]
      \begin{tikzpicture}[every node/.style={inner sep=0pt, outer sep=0pt}]
        \node[anchor=south west] (image) {
          \iftoggle{jyumonochromatic}
          {\includegraphics[height=27mm]{jyu-tight-outline}}
          {\includegraphics[height=27mm]{jyu-tight}}};
        \begin{scope}[x=1mm, y=1mm]
          \node[align=left, anchor=north west] at (10, 11) {
            \fontfamily{ppl}\selectfont
            \MakeUppercase\jyuinstitutex \\
            \MakeUppercase\jyudepartmentx};
        \end{scope}
      \end{tikzpicture}}
  \end{titlepage}}

\newcommand \appendixsection[1]{
  \clearpage
  \section{#1}
  \pagenumbering{arabic}
  \renewcommand \thepage{\thesection--\arabic{page}}}

\input{jyupreamble}

\endinput
