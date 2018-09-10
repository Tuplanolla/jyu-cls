\ProvidesClass{jyuposter}[2018/09/07 University of Jyväskylä Poster]
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

% Use `\selectcolormodel{cmyk}` for print.
\RequirePackage{xcolor}
\definecolor{jyublue}{RGB/cmyk}{29, 61, 102 / 1.00, 0.71, 0.09, 0.56}
\definecolor{jyuorange}{RGB/cmyk}{221, 88, 61 / 0.00, 0.82, 0.80, 0.00}
\definecolor{jyugold}{RGB/cmyk}{190, 154, 84 / 0.08, 0.29, 0.66, 0.19}
\definecolor{jyusilver}{RGB/cmyk}{202, 202, 199 / 0.08, 0.05, 0.07, 0.16}

\RequirePackage{tikz}

% The package `tikzscale` would allow using the command `\includegraphics`,
% but it does not register the file extension early enough to be usable.
\tikzset{
  jyutorch/.style={},
  jyuhandle/.style={fill=jyublue, draw=none},
  jyuflame/.style={fill=jyuorange, draw=none}}
\newcommand \jyulogo{\input{jyulogo}}

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

\PassOptionsToPackage{headsep=0mm,
  includehead, includefoot,
  a1paper, bottom=25mm, left=25mm, right=25mm, top=25mm
}{geometry}
% \PassOptionsToPackage{showframe}{geometry}
\RequirePackage{geometry}

\newcommand \makesetup{
  \edef \jyuauthorx{\iftoggle{jyufinnished}
    \jyuauthorfinnish \jyuauthor}
  \edef \jyutitlex{\iftoggle{jyufinnished}
    \jyutitlefinnish \jyutitle}
  \edef \jyupublicationx{\iftoggle{jyufinnished}
    \jyupublicationfinnish \jyupublication}
  \edef \jyusupervisorx{\iftoggle{jyufinnished}
    \jyusupervisorfinnish \jyusupervisor}
  \edef \jyuinstitutex{\iftoggle{jyufinnished}
    \jyuinstitutefinnish \jyuinstitute}
  \edef \jyufacultyx{\iftoggle{jyufinnished}
    \jyufacultyfinnish \jyufaculty}
  \edef \jyudepartmentx{\iftoggle{jyufinnished}
    \jyudepartmentfinnish \jyudepartment}
  \edef \jyuurlx{\iftoggle{jyufinnished}
    \jyuurlfinnish \jyuurl}
  \edef \jyusloganx{\iftoggle{jyufinnished}
    \jyusloganfinnish \jyuslogan}
  \edef \jyushortsloganx{\iftoggle{jyufinnished}
    \jyushortsloganfinnish \jyushortslogan}

  \hypersetup{
    pdfauthor=\jyuauthorx,
    pdftitle=\jyutitlex,
    pdfsubject=\jyupublicationx}

% Do not touch this...
\newsavebox \crapbox
\savebox \crapbox{
\begin{minipage}[t]{400mm}
\color{jyublue}
\vspace{15mm}
\fontfamily{fla}\fontseries b\fontshape n\fontsize{30}{34}\selectfont
\ifdefempty{\jyufacultyx}{}{\MakeUppercase{\jyufacultyx} \\}
\ifdefempty{\jyudepartmentx}{}{\MakeUppercase{\jyudepartmentx} \\}
\ifdefempty{\jyurlx}{}{\MakeUppercase{\jyuurlx} \\[\baselineskip]}
  \setcounter{jyuauthorcounter} 0
  \renewcommand* \do[1]{\stepcounter{jyuauthorcounter}
    \ifnumcomp{\value{jyuauthorcounter}} > 1
    {\\}{}
    \fontfamily{fla}\fontseries b\fontshape n\fontsize{30}{34}\selectfont
    ##1%
\fontfamily{fla}\fontseries m\fontshape n\fontsize{25}{30}\selectfont%
, University of Jyväskylä}
%
  \expandafter\docsvlist\expandafter{\jyuauthorx}
% ...unless you are very careful.
\end{minipage}
}
\newlength \crapboxh
\settototalheight \crapboxh{\usebox \crapbox}
\newlength \crapboxhh
\setlength \crapboxhh{\maxof{110mm}{\crapboxh}}
\setlength \headheight{\crapboxhh}
\newlength \crapboxhhh
\setlength \crapboxhhh{\crapboxhh}
\addtolength \crapboxhhh{10mm}
\renewcommand \headrulewidth{0pt}
\renewcommand \footrulewidth{0pt}
\lhead{}
\chead{
\begin{tikzpicture}[remember picture, overlay]
\node[rectangle, fill=jyublue, anchor=north west,
xshift=25mm, yshift=0mm,
minimum width=120mm, minimum height=\crapboxhhh] (travis) at (current page.north west) {
\begin{minipage}[b]{100mm}
\centering
\vspace{6mm}
\hspace{20mm}
\tikzset{
  jyuhandle/.style={fill=white, draw=none},
  jyuflame/.style={fill=white, draw=none}}
\resizebox !{54mm} \jyulogo
\hspace{20mm}
\vspace{6mm} \\
\fontfamily{fla}\fontseries b\fontshape n\fontsize{25}{30}\selectfont
\color{jyuorange} \MakeUppercase{JYU.}
\color{white} \MakeUppercase{\jyushortsloganx}
\end{minipage}
};
\node[rectangle, anchor=north west,
xshift=25mm, yshift=0mm,
minimum width=400mm, minimum height=\crapboxhhh] at (travis.north east) {
\usebox \crapbox
};
\end{tikzpicture}}
\rhead{}
\lfoot{}
\cfoot{
\begin{tikzpicture}[remember picture, overlay]
\node[rectangle, fill=jyublue,
anchor=south west, minimum width=\paperwidth, minimum height=15mm] (mike) at (current page.south west) {};
\node[rectangle, inner sep=10mm, anchor=south west] at (mike.north west) {
\begin{minipage}[b]{\paperwidth}
  \centering
  \fontfamily{fla}\fontseries b\fontshape n\fontsize{25}{30}\selectfont
  \color{jyugold} \MakeUppercase{JYU.}
  \color{jyublue} \MakeUppercase{\jyusloganx}
\end{minipage}
};
\end{tikzpicture}}
\rfoot{}
  }

\renewcommand \maketitle{
  % These breaks are fragile; investigate.
  \bigskip
  \fontfamily{RobotoSlab-LF}\fontseries b\fontshape n\fontsize{100}{105}\selectfont
  \begin{raggedright}
  \MakeUppercase{\jyutitlex}
  \end{raggedright}
  \bigskip

  \fontfamily{fla}\fontseries b\fontshape n\fontsize{16}{26}\selectfont
  \setlength \columnsep{15mm}
}

\newcommand \appendixsection[1]{
  \cleardoublepage
  \section{#1}
  \pagenumbering{arabic}
  \renewcommand \thepage{\thesection--\arabic{page}}}

  \newcounter{jyuauthorcounter}
%
\RequirePackage{fancyhdr}
\AtBeginDocument{\pagestyle{fancy}}

\AtBeginDocument{\color{jyublue}}

\RequirePackage{lipsum}
\titleformat \section{
  % The documentation for the package `lato`
  % says `eb` is for Heavy and `ub` is for Black,
  % but in older versions `eb` is for Black and `ub` does not exist.
  \fontfamily{fla}\fontseries{eb}\fontshape n\fontsize{22}{26}\selectfont
}{\thesection}{}{\MakeUppercase}

\input{jyupreamble}

\endinput
