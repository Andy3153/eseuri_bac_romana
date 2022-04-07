\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eseuri_bac_romana}[2022/03/25 My custom class for the essay book]

\LoadClass[
 12pt,                           % Font size
 a4paper                         % Paper type
]{book}

% Packages
\RequirePackage[
 margin=2.7cm,                   % Margin size
 marginparwidth=2cm,             % Margin note size
 marginparsep=3mm,               % Space between margin and text
 headheight=15pt                 % Header height (fix that stupid warn from fancyhdr)
]{geometry}
\RequirePackage[romanian]{babel} % Romanian characters support
\RequirePackage{indentfirst}     % Add paragraph indentation even after a section
\RequirePackage{marginnote}      % Notes on the margins of a document (more advanced \marginpar)
\RequirePackage{titlesec}        % Customize titles
\RequirePackage{graphicx}        % Image support
\RequirePackage{xcolor}          % Custom colors
\RequirePackage{fancyhdr}        % Custom headers
\RequirePackage[titles]{tocloft} % Customize ToC
\RequirePackage[dash]{dashundergaps}
\RequirePackage{hyperref}        % Hyperlink support, keep last in package list!
\RequirePackage{bookmark}

% Image path
\graphicspath{ {../img/} }

% Hyperlink configuration
\hypersetup{
 colorlinks=true,
 urlcolor=black,
 linkcolor=black  % ToC links color
}

% Colors (for chapter)
\definecolor{gray75}{gray}{0.75}

% Custom format for titles, sections etc.
\titleformat{\part}[display]
 {\Huge\scshape\filright}
 {\partname~\thepart:}
 {20pt}
 {\thispagestyle{empty}}

\newcommand{\DetermineHSpaceSize}{\ifnum\value{chapter} > 9 {\hspace{7pt}}\else{\hspace{15pt}}\fi} % Make the hspace that goes between chapter number and line smaller if number is past 10
\titleformat{\chapter}[hang]
 {\Large}
 {\thechapter\DetermineHSpaceSize\textcolor{gray75}{|}\hspace{15pt}}
 {0pt}
 {\thispagestyle{chapterfancystyle}\Large}

\renewcommand{\thesection}{\arabic{section}} % Remove chapter number from section
\titleformat*{\section}
 {\large\bfseries}

\titleformat{\subsection}
 {\normalfont\normalfont\bfseries}
 {}
 {1.5em}
 {}

% Custom commands
% Format: \newcommand{\command}[variable]{action #variable}
\newcommand{\rom}[1]{\uppercase\expandafter{\romannumeral #1\relax}} % Roman numerals
\newcommand{\textbfit}[1]{\textbf{\textit{#1}}}                      % combine bold and italic
\newcommand{\ex}[1]{\dashuline{\texttt{\footnotesize#1}}}                              % things to be filled by the reader
\newcommand{\comment}[1]{}                                           % comments
\newcommand{\operatitle}{}                                           % to not get errors
\newcommand{\operaauthor}{}                                          % to not get errors
\newcommand{\ApplySubIIStyling}                                      % custom styling for a part of the document
{
 %\setcounter{tocdepth}{0} % Now begin allowing sections to appear
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
  \setcounter{tocdepth}{1}
  \setcounter{section}{0}
 %\newcommand{\sectionbreak}{\ifnum\value{section}>0 \clearpage\fi}
}

\newcommand{\CustomToC} % command to generate ToC with empty pagestyle
{
 % EVERYTHING YOU SEE HERE
 %      was made in order to
 %          disable page numbers, headers, everything
 %                  inside the Table of
 %                          Contents
 %                                 (why is ToC so hard to make yours)
 \addtocontents{toc}{\protect\thispagestyle{empty}}
 \clearpage               % new page to ensure it switched to empty pagestyle
 {
   \pagestyle{empty}
   \fancypagestyle{plain} % create temporary plain pagestyle
   {
     \fancyhf{}
     \renewcommand{\headrulewidth}{0pt}
     \renewcommand{\footrulewidth}{0pt}
   }
   \tableofcontents       % actually generate the ToC
   \thispagestyle{empty}
 }
 \pagestyle{plain}        % revert to plain pagestyle
}

% Fix errors in PDF bookmark generation
\pdfstringdefDisableCommands{
 \def\\{}
}


% Customize \marginnote font
\renewcommand\marginfont{\ttfamily\footnotesize}

% Make \ttfamily hyphenate words for the margin notes
\DeclareFontFamily{OT1}{cmtt}{\hyphenchar\font=-1}
\DeclareFontFamily{\encodingdefault}{\ttdefault}{\hyphenchar\font=`\-}
\DeclareFontFamily{T1}{cmtt}{\hyphenchar\font=45}

% ToC customization
\setcounter{tocdepth}{0} % Make only chapters appear in ToC
\renewcommand{\cftdot}{} % Remove ToC dots
\addtocontents{toc}{\string\renewcommand{\protect\cftchappagefont}{\protect\normalfont}}
\addtocontents{toc}{\string\renewcommand{\protect\cftchapfont}{\protect\normalfont}}
\addtocontents{toc}{\string\renewcommand{\protect\cftchapleader}{\protect\normalfont\protect\cftdotfill{\protect\cftsecdotsep}}} % Disable bold in ToC

% Custom fancy styles
\fancypagestyle{chapterfancystyle}{
 \fancyhf{}
 \fancyfoot[LE,RO]{\thepage}
 \renewcommand{\headrulewidth}{0pt}
 \renewcommand{\footrulewidth}{1pt}
} % style for chapter page

\fancypagestyle{plain}{
 \fancyhf{}
 \fancyhead[LE]{\small\textsc{Eseuri pentru bacalaureat}}
 \fancyhead[RO]{
  \begingroup
    \small
    \let\textbfit\relax % smart thing to use \textsc in header but keep it bfit everywhere else
    \textsc{\operatitle\ -- \operaauthor}
  \endgroup
 }
 \fancyfoot[LE,RO]{\thepage}
 \renewcommand{\headrulewidth}{2pt}
 \renewcommand{\footrulewidth}{1pt}
} % style for the rest of the document

% Use empty pagestyle on blank pages between chapters
\makeatletter
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
 \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\makeatother

% Create custom title
\renewcommand{\maketitle}
{
 \begin{titlepage}
  \centering
  \vspace*{1cm}
  \vspace{4\baselineskip}
  {\Huge
  Eseuri pentru bacalaureatul la \\ Limba și Literatura Română\par}
  \vspace{4\baselineskip}
  de\par
  {\Large\textsc{Dobrete Andrei-Robert}\par}
  \vfill
  \includegraphics[height=\fontcharht\font`\B]{gitlab}
  \url{gitlab.com/Andy3153/eseuri_bac_romana}\par
  \includegraphics[height=\fontcharht\font`\B]{github}
  \url{github.com/Andy3153/eseuri_bac_romana}\par
  \vspace{1.5\baselineskip}
  {\large\LaTeXe}
 \end{titlepage}
}
