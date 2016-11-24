% Class for What is Buddhism?
%
% Based on hark <https://github.com/profound-labs/hark>
%
% LPPL LaTeX Pubic Project Licence

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whatisbuddhism}[2016/11/23 v1.1 Booklet class for What is Buddhism?]

\RequirePackage{calc}

\LoadClass[11pt,twoside,openany]{memoir}

\DeclareOption{booklet}{%
  \newcommand{\preparehyphenation}{%
    % Sloppy hyphenation
    \sloppy
    % Don't hyphenate too much (or across pages)
    \RequirePackage[hyphenation]{impnattypo}
  }%
}
\ProcessOptions\relax

%
% Package Requirements
%

\preparehyphenation
% Rules for English
\RequirePackage[english]{babel}
% Conditional logic
\RequirePackage{etoolbox}
% Colors
\RequirePackage{xcolor}
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
% Item spacing
\RequirePackage{enumitem}
% Creative Commons Icons
\RequirePackage{ccicons}

%\usepackage{showframe}

%
% Colors
%

\definecolor{header}{gray}{0.6}
\definecolor{section}{gray}{0.4}

%
% Layout
%

\setstocksize{126mm}{126mm}
\settrimmedsize{120mm}{120mm}{*}
\settypeblocksize{90mm}{90mm}{*}
\settrims{3mm}{3mm}
\setlrmargins{*}{*}{1}
\setulmargins{*}{*}{1}
\setheadfoot{0pt}{0pt}
%\setheaderspaces{0pt}{*}{*}
\checkandfixthelayout

\input{pdfpageattr.tex}

%
% Text and Fonts
%

\setmainfont[BoldFont={Gentium Basic Bold},ItalicFont={Gentium Italic}]{Gentium}
\defaultfontfeatures{Ligatures={TeX}}

\newfontfamily\sansfont{Source Sans Pro}

\newcommand{\documentfontsize}{%
  \fontsize{10.5pt}{15.3pt}\selectfont%
}

\renewcommand{\normalsize}{%
  \documentfontsize\selectfont%
}

% More spacing
\newcommand{\settitlespacing}{%
  \titlespacing*{\section}{0pt}{2em}{1em}%
}

% Lettrine
\setlength{\DefaultFindent}{1pt}
\renewcommand{\DefaultLoversize}{0.2}

%
% Front Styles
%

\newcommand{\frontstyles}{%
  % Suppress page numbering
  \pagestyle{empty}%
}

\newenvironment{frontenv}{%
  \begin{center}%
  \begin{vplace}[0.8]
}{%
  \end{vplace}
  \end{center}%
}

\newenvironment{copyrightenv}{%
  \begingroup
  \raggedright%
  \flushbottom%
  \small%
  \setlength{\parskip}{0.8em}%
%  \linespread{1.0}\selectfont%
}{%
  \endgroup%
}

\newenvironment{dedicationenv}{%
  \begin{center}%
  \begin{large}%
  \begin{vplace}[0.8]
  \begingroup%
  \setlength{\parskip}{1em}%
}{%
  \endgroup%
  \end{vplace}
  \end{large}%
  \end{center}%
}

\newenvironment{copyrightindent}{%
  \vspace{-0.3em}%
  \setlength{\leftskip}{2em}%
}{%
  \par%
}

%
% Main Styles
%

\newcommand{\mainstyles}{%
  % Enable page numbering
  \pagenumbering{arabic}%
  \pagestyle{mainpagestyle}%
}

\newenvironment{mainenv}{%
  % Don't push paragraphs to the bottom the page
  \begingroup%
  \raggedbottom%
  \normalsize%
}{%
  \endgroup%
}

% Allow for more spacing due to turning off hyphenation
\tolerance=8000
\hbadness=8000

%
% Back Styles
%

\newcommand{\backstyles}{%
  % Suppress page numbering
  \pagestyle{empty}%
}

\newenvironment{licenseenv}{%
  \begingroup%
  \setlength{\parindent}{0pt}%
  \flushbottom%
  \footnotesize%
  \setlist{nosep}
  \setlength{\parskip}{1.0em}%
%  \linespread{1.0}\selectfont%
}{%
  \endgroup%
}

\newenvironment{licenseitemize}{%
  \begin{itemize}%
    \setlength{\itemsep}{0.5em}%
    \setlength{\parskip}{0pt}%
    \setlength{\parsep}{0pt}%
}{%
  \end{itemize}%
}

%
%
% Headers / Footers
%

% Suppress headers and footers
\makepagestyle{mainpagestyle}
\makeoddhead{mainpagestyle}{}{}{}
\makeevenhead{mainpagestyle}{}{}{}
\makeoddfoot{mainpagestyle}{}{}{}
\makeevenfoot{mainpagestyle}{}{}{}

%
% Sections
%

% Section titles are gray, large font, centered
\titleformat{\section}{\sectionstyle}{\thesection}{1em}{}
\settitlespacing

\newcommand{\sectionstyle}{%
  \sansfont%
  \Large%
  \color{section}%
  \centering%
}

% Page break after each section
\let\oldsection\section
\renewcommand\section{\clearpage\oldsection}

% Turn off section numbering
\setsecnumdepth{part}

%
% Last bits...
%

% Fixes overflows; must be loaded last
\RequirePackage[final,babel=true]{microtype}
