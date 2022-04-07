\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eseuri_bac_romana}[2022/03/25 My custom class for the essay book]

\LoadClass[
 12pt,                           % Font size
 a4paper                         % Paper type
]{book}

% Packages
\RequirePackage{../my_style}     % My custom stylings
\RequirePackage{graphicx}        % Image support

% Image path
\graphicspath{ {../img/} }

% Custom commands
% Format: \newcommand{\command}[variable]{action #variable}
\newcommand{\operatitle}{}                                           % to not get errors
\newcommand{\operaauthor}{}                                          % to not get errors
\renewcommand{\HeaderLEText}{Eseuri pentru bacalaureat}              % header text
\renewcommand{\HeaderROText}{\operatitle\ -- \operaauthor}           % header text
\newcommand{\ApplySubIIStyling}                                      % custom styling for a part of the document
{
 %\setcounter{tocdepth}{0} % Now begin allowing sections to appear
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
  \setcounter{tocdepth}{1}
  \setcounter{section}{0}
 %\newcommand{\sectionbreak}{\ifnum\value{section}>0 \clearpage\fi}
}

% ToC customization
\setcounter{tocdepth}{0} % Make only chapters appear in ToC


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
