% Class for What is Buddhism?
%
% Based on hark <https://github.com/profound-labs/hark>
%
% LPPL LaTeX Pubic Project Licence

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whatisbuddhism}[2015/12/05 v1.0 Booklet class for What is Buddhism?]

\RequirePackage{calc}

\LoadClass[11pt,twoside,openany]{memoir}

%
% Package Requirements
%

% Disable hyphenation
\RequirePackage[english=nohyphenation]{hyphsubst}
% Rules for English
\RequirePackage[english]{babel}
% Conditional logic
\RequirePackage{etoolbox}
% Colors
\RequirePackage[cmyk]{xcolor}
% Fonts
\RequirePackage{fontspec}
% Custom section titles
\RequirePackage{titlesec}

%
% Colors
%

\definecolor{header}{gray}{0.6}
\definecolor{section}{gray}{0.4}

%
% Layout
%

\setstocksize{120mm}{120mm}
\settrimmedsize{120mm}{120mm}{*}
\settrims{0pt}{0pt}
\settypeblocksize{90mm}{90mm}{*}
\setlrmargins{*}{*}{1.2}
\setulmargins{*}{*}{0.7}
\setheadfoot{15pt}{0pt}
\setheaderspaces{5mm}{*}{*}
\checkandfixthelayout

% Don't push paragraphs to the bottom the page
\raggedbottom

%
% Fonts
%

\setmainfont{Gentium}
\defaultfontfeatures{Ligatures={TeX}}

\newfontfamily\sansfont{Source Sans Pro}

%
% Text
%

\renewcommand{\normalsize}{%
  \fontsize{11.5pt}{14pt}\selectfont%
}
\normalsize% Select it now

% Allow for more spacing due to turning off hyphenation
\tolerance=8000
\hbadness=8000

%
% Headers
%

% Seperate dot style from hark
\newcommand{\sepdot}{%
  \hspace*{6pt}%
  $\cdot$%
  \hspace*{6pt}%
}

% Don't show section names in headers on pages with the section at the top
\newcommand{\suppressifsectionattop}[1]{%
  \ifboolexpr{%
    test {\ifnumcomp{\value{page}}{=}{1}} or
    test {\ifnumcomp{\value{page}}{=}{19}} or
    test {\ifnumcomp{\value{page}}{=}{23}} or
    test {\ifnumcomp{\value{page}}{=}{25}}
  }{}{#1}%
}

% Show section on both odd and even headers
\renewcommand*{\sectionmark}[1]{\markboth{#1}{#1}}

% Headers are gray, 10pt sans serif
\newcommand{\headerstyle}{%
  \sansfont%
  \fontsize{10pt}{10pt}\selectfont%
  \color{header}%
}

% Show section name and page number for both odd and even headers
\makepagestyle{mainstyle}
\makeoddhead{mainstyle}{}{}{%
  \headerstyle%
  \suppressifsectionattop{\leftmark\sepdot}%
  \thepage%
}
\makeevenhead{mainstyle}{%
  \headerstyle%
  \thepage%
  \suppressifsectionattop{\sepdot\rightmark}%
}{}{}

% Suppress footers
\makeoddfoot{mainstyle}{}{}{}
\makeevenfoot{mainstyle}{}{}{}

%
% Sections
%

% Section titles are gray, large font, centered
\newcommand{\sectionstyle}{%
  \sansfont%
  \Large%
  \color{section}%
  \centering%
}

\titleformat{\section}{\sectionstyle}{\thesection}{1em}{}

% Turn off section numbering
\setsecnumdepth{part}

%
% Last bits...
%

% Fixes overflows; must be loaded last
\RequirePackage[final,babel=true]{microtype}
