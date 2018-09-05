\ProvidesClass{jyuposter}[2018/09/01 University of Jyväskylä Poster]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{amssymb}

\PassOptionsToPackage{intlimits, sumlimits}{amsmath}
\RequirePackage{amsmath}

\RequirePackage{etoolbox}
\newtoggle{jyumonochromatic}
\newtoggle{jyufinnished}
\DeclareOption{monochromatic}{\toggletrue{jyumonochromatic}}
\DeclareOption{finnished}{\toggletrue{jyufinnished}}
\PassOptionsToClass{a1, portrait}{a0poster}
\DeclareOption*{\PassOptionsToClass \CurrentOption{a0poster}}
\ProcessOptions*
\LoadClass{a0poster}

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

\RequirePackage{epstopdf}

\RequirePackage{tikz}

% Use `\selectcolormodel{cmyk}` for print.
\RequirePackage{xcolor}
\definecolor{jyublue}{RGB/cmyk}{29, 61, 102 / 1.00, 0.71, 0.09, 0.56}
\definecolor{jyuorange}{RGB/cmyk}{221, 88, 61 / 0.00, 0.82, 0.80, 0.00}
\definecolor{jyugold}{RGB/cmyk}{190, 154, 84 / 0.08, 0.29, 0.66, 0.19}
\definecolor{jyusilver}{RGB/cmyk}{202, 202, 199 / 0.08, 0.05, 0.07, 0.16}

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
  giveninits=true, minnames=1, maxnames=3,
  sorting=none, style=numeric-comp}{biblatex}
\RequirePackage{biblatex}
\DefineBibliographyStrings{finnish}{
  candthesis={LuK-tutkielma},
  mathesis={pro gradu~-tutkielma},
  phdthesis={väitöskirja},
  references={Lähteet}}

\RequirePackage{csquotes}

\RequirePackage{booktabs}

% Geometry.

\PassOptionsToPackage{noindentafter}{titlesec}
\RequirePackage{titlesec}

\PassOptionsToPackage{margin=12pt}{caption}
\RequirePackage{caption}

\RequirePackage{microtype}

% The recommended fonts are Aleo and Lato.
% While Lato is free and provided in a LaTeX package,
% Aleo is proprietary garbage and thus not available.
% The best visual approximations of Aleo are
%
% * Bitter from Huerta Tipográfica,
% * Kadwa from Sol Matas (the successor of Bitter) and
% * Roboto from Christian Robertson.
%
% Since Roboto is the only one of these available in a LaTeX package,
% we choose it as our Aleo replacement.
%
% The packages `roboto` and `lato` provide
% the desired serif and sans-serif fonts for titles and text respectively.
% However, neither of them provide fonts for math.
% The documentation for `lato` recommends accompanying it
% with the packages `mdsymbol` and `mathastext`
% to obtain sans-serif fonts for math,
% but the resulting combination is less than ideal.
% While `mdsymbol` provides symbols and
% `mathastext` provides some Latin letters,
% neither of them provide Greek letters or correctly italicized Latin letters.
% Attempting to address these shortcomings
% by switching from `mathastext` to the package `sfmath` is not possible,
% because it is not compatible with `lato` and does not feature Greek letters.
% Switching to the package `sansmath` instead
% (with the command `\sansmath`) would be an option,
% but it does not provide symbols and is incompatible with `mdsymbol`,
% which would provide the missing symbols.
% The only remaining choice is to use `newtxsf`,
% which can be further augmented by `mdsymbol`.

\RequirePackage{roboto}

\PassOptionsToPackage{default}{lato}
\RequirePackage{lato}

\RequirePackage{newtxsf}

\RequirePackage{mdsymbol}

% Box time!

\RequirePackage{tcolorbox}

\tcbset{colback=jyublue, colupper=white, arc=0mm, boxsep=10mm, boxrule=0pt,
fonttitle=\bfseries, nobeforeafter}

\RequirePackage{multicol}

\PassOptionsToPackage{headsep=20mm,
  a1paper, bottom=35mm, left=25mm, right=25mm, top=120mm}{geometry}
\RequirePackage{geometry}

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

\renewcommand \maketitle{
  % These breaks are fragile; investigate.
  \bigskip
  \fontfamily{RobotoSlab-LF}\fontseries b\fontshape n\fontsize{100}{105}\selectfont
  \begin{raggedright}
  \MakeUppercase{\jyutitlex}
  \end{raggedright}
  \bigskip

  % See table 4 in the documentation for the package `lato` for more options.
  \fontfamily{fla}\fontseries b\fontshape n\fontsize{16}{26}\selectfont
  \setlength \columnsep{15mm}
}

\newcommand \appendixsection[1]{
  \cleardoublepage
  \section{#1}
  \pagenumbering{arabic}
  \renewcommand \thepage{\thesection--\arabic{page}}}

\RequirePackage{fancyhdr}
\renewcommand \headrulewidth{0pt}
\renewcommand \footrulewidth{0pt}
\lhead{}
\chead{
\begin{tikzpicture}[remember picture, overlay]
\node[rectangle, fill=jyublue, anchor=north west] at (current page.north west) {
\begin{minipage}[b]{0.2\paperwidth}
  \vspace{6mm}
  \hspace{20mm}
  \includegraphics[height=50mm]{torch}
  \hspace{20mm}
  \vspace{6mm}
\end{minipage}
\begin{minipage}[b]{0.8\paperwidth}
  \begin{tcolorbox}[width=\columnwidth-100mm,
  colback=jyusilver, colupper=jyublue]
  Tähän laatikkoon voi työntää jotain ja
  tämän laatikon voi sitten työntää jonnekin.
  \end{tcolorbox}
\end{minipage}
};
\end{tikzpicture}}
% Alternative style.
\chead{
\begin{tikzpicture}[remember picture, overlay]
\node[rectangle, fill=jyublue, anchor=north west, name=travis,
xshift=25mm, yshift=0mm,
minimum width=100mm, minimum height=100mm] at (current page.north west) {
\begin{minipage}[b]{80mm}
\centering
\vspace{6mm}
\hspace{20mm}
\includegraphics[height=50mm]{torch}
\hspace{20mm}
\vspace{6mm} \\
\fontfamily{fla}\fontseries b\fontshape n\fontsize{25}{30}\selectfont
\color{jyuorange} \MakeUppercase{JYU.}
\color{white} \MakeUppercase{Since 1863.}
\end{minipage}
};
\node[rectangle, anchor=north west,
xshift=25mm, yshift=0mm,
minimum width=400mm, minimum height=100mm] at (travis.north east) {
\begin{minipage}[b]{400mm}
\fontfamily{fla}\fontseries b\fontshape n\fontsize{30}{34}\selectfont
\MakeUppercase{Informaatioteknologian Tiedekunta} \\
\MakeUppercase{https://www.jyu.fi/it/} \\[\baselineskip]
\fontfamily{fla}\fontseries b\fontshape n\fontsize{25}{30}\selectfont
\jyuauthorx
\fontfamily{fla}\fontseries m\fontshape n\fontsize{25}{30}\selectfont
,
University of Jyväskylä
\end{minipage}
};
\end{tikzpicture}}
\rhead{}
\lfoot{}
\cfoot{
\begin{tikzpicture}[remember picture, overlay]
\node[name=mike, rectangle, fill=jyublue,
anchor=south west, minimum width=\paperwidth, minimum height=15mm] at (current page.south west) {};
\node[rectangle, inner sep=10mm, anchor=south west] at (mike.north west) {
\begin{minipage}[b]{\paperwidth}
  \centering
  \fontfamily{fla}\fontseries b\fontshape n\fontsize{25}{30}\selectfont
  \color{jyugold} \MakeUppercase{JYU.}
  \color{jyublue} \MakeUppercase{Tulevaisuuden palveluksesssa jo vuodesta 1863.}
\end{minipage}
};
\end{tikzpicture}}
\rfoot{}
\AtBeginDocument{\pagestyle{fancy}}

\AtBeginDocument{\color{jyublue}}

\RequirePackage{lipsum}
\titleformat \section{
\fontfamily{RobotoSlab-LF}\fontseries b\fontshape n\fontsize{22}{26}\selectfont
}{\thesection}{}{\MakeUppercase}

\input{jyupreamble}

\endinput
