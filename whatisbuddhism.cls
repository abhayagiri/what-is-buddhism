% Class for What is Buddhism?
%
% Based on hark <https://github.com/profound-labs/hark>
%
% LPPL LaTeX Pubic Project Licence

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whatisbuddhism}[2015/12/05 v1.0 Booklet class for What is Buddhism?]

\RequirePackage{calc}

\LoadClass[11pt,twoside,openany]{memoir}

\DeclareOption{short-booklet}{%
  \newcommand{\documentfontsize}{%
    \fontsize{10pt}{13pt}\selectfont%
  }%
  \newcommand{\suppressifsectionattop}[1]{%
    \ifboolexpr{
      test {\ifnumcomp{\value{page}}{=}{1}} or
      test {\ifnumcomp{\value{page}}{=}{15}} or
      test {\ifnumcomp{\value{page}}{=}{18}}
    }{}{#1}
  }%
}
\DeclareOption{normal-booklet}{%
  \newcommand{\documentfontsize}{%
    \fontsize{11pt}{15.5pt}\selectfont%
  }%
  \newcommand{\suppressifsectionattop}[1]{%
    \ifboolexpr{
      test {\ifnumcomp{\value{page}}{=}{1}} or
      test {\ifnumcomp{\value{page}}{=}{19}} or
      test {\ifnumcomp{\value{page}}{=}{23}}
    }{}{#1}
  }%
}
\ProcessOptions\relax

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
% Drop capitals
\RequirePackage{lettrine}
% Widow and orphan control
\RequirePackage[all]{nowidow}
% Links
\RequirePackage{hyperref}
% Line Spacing
\DisemulatePackage{setspace}
\RequirePackage{setspace}

%
% Colors
%

\definecolor{header}{gray}{0.6}
\definecolor{section}{gray}{0.4}

%
% Layout
%

% \setstocksize{120mm}{120mm}
% \settrimmedsize{120mm}{120mm}{*}
\setstocksize{4.75in}{4.75in}
\settrimmedsize{4.75in}{4.75in}{*}
\settrims{0pt}{0pt}
\settypeblocksize{95mm}{90mm}{*}
\setlrmargins{*}{*}{1.2}
\setulmargins{*}{*}{0.7}
\setheadfoot{16pt}{0pt}
\setheaderspaces{5mm}{*}{*}
\checkandfixthelayout

%
% Text and Fonts
%

\setmainfont{Gentium}
\defaultfontfeatures{Ligatures={TeX}}

\newfontfamily\sansfont{Source Sans Pro}

\renewcommand{\normalsize}{%
  \documentfontsize\selectfont%
}

% Lettrine
\setlength{\DefaultFindent}{1pt}
\renewcommand{\DefaultLoversize}{0.2}

%
% Front Page and Copyright
%

\newcommand{\frontstyles}{%
  % Suppress page numbering
  \pagestyle{empty}%
}

\newenvironment{frontenv}{%
  \newpage%
  \normalsize%
  \begin{center}%
}{%
  \end{center}%
}

\newenvironment{copyrightenv}{%
  \newpage%
  \raggedright%
  \flushbottom%
  \small%
  \setlength{\parskip}{0.5em}%
  \linespread{0.8}\selectfont%
}{}

\newenvironment{copyrightindent}{%
  \vspace{-0.3em}
  \setlength{\leftskip}{5em}%
}{%
  \par%
}

%
% Main Body
%

\newcommand{\mainstyles}{%
  % Enable page numbering
  \pagenumbering{arabic}%
  \pagestyle{mainpagestyle}%
}

\newenvironment{mainenv}{%
  % Don't push paragraphs to the bottom the page
  \raggedbottom%
  \normalsize%
}{}

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

% Show section on both odd and even headers
\renewcommand*{\sectionmark}[1]{\markboth{#1}{#1}}

% Headers are gray, 10pt sans serif
\newcommand{\headerstyle}{%
  \sansfont%
  \fontsize{10pt}{10pt}\selectfont%
  \color{header}%
}

% Show section name and page number for both odd and even headers
\makepagestyle{mainpagestyle}
\makeoddhead{mainpagestyle}{}{}{%
  \headerstyle%
  \suppressifsectionattop{\leftmark\sepdot}%
  \thepage%
}
\makeevenhead{mainpagestyle}{%
  \headerstyle%
  \thepage%
  \suppressifsectionattop{\sepdot\rightmark}%
}{}{}

% Suppress footers
\makeoddfoot{mainpagestyle}{}{}{}
\makeevenfoot{mainpagestyle}{}{}{}

%
% Sections
%

% Section titles are gray, large font, centered
\titleformat{\section}{\sectionstyle}{\thesection}{1em}{}
% Reduce spacing
\titlespacing*{\section}{0pt}{2.1ex}{1ex}

\newcommand{\sectionstyle}{%
  \sansfont%
  \Large%
  \color{section}%
  \centering%
}

% Turn off section numbering
\setsecnumdepth{part}

%
% Last bits...
%

% Fixes overflows; must be loaded last
\RequirePackage[final,babel=true]{microtype}
