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
    \fontsize{10.5pt}{13.7pt}\selectfont%
  }%
  \newcommand{\setdocumentdimensions}{%
    \settypeblocksize{95mm}{90mm}{*}
  }%
  \newcommand{\settitlespacing}{%
    % Reduce spacing
    \titlespacing*{\section}{0pt}{2.1ex}{1ex}%
  }%
  \newcommand{\preparehyphenation}{%
    % Enable hyphenation (default) for short booklet
  }%
}
\DeclareOption{normal-booklet}{%
  \newcommand{\documentfontsize}{%
    \fontsize{11pt}{15.5pt}\selectfont%
  }%
  \newcommand{\setdocumentdimensions}{%
    \settypeblocksize{95mm}{90mm}{*}
  }%
  \newcommand{\settitlespacing}{%
    % Reduce spacing
    \titlespacing*{\section}{0pt}{2.1ex}{1ex}%
  }%
  \newcommand{\preparehyphenation}{%
    % Disable hyphenation for normal booklet
    \RequirePackage[english=nohyphenation]{hyphsubst}%
  }%
}
\DeclareOption{spaced-booklet}{%
  \newcommand{\documentfontsize}{%
    \fontsize{10.5pt}{15.3pt}\selectfont%
  }%
  \newcommand{\setdocumentdimensions}{%
    \settypeblocksize{90mm}{90mm}{*}
  }%
  \newcommand{\settitlespacing}{%
    % More spacing
    \titlespacing*{\section}{0pt}{2em}{1em}%
  }%
  \newcommand{\preparehyphenation}{%
    % Enable hyphenation (default) for spaced booklet
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

%
% Colors
%

\definecolor{header}{gray}{0.6}
\definecolor{section}{gray}{0.4}

%
% Layout
%

\setstocksize{5in}{5in}
\settrimmedsize{4.75in}{4.75in}{*}
\setdocumentdimensions
\settrims{0pt}{0pt}
\setlrmargins{*}{*}{1.2}
\setulmargins{*}{*}{0.7}
\setheadfoot{0pt}{0pt}
\setheaderspaces{5mm}{*}{*}
\checkandfixthelayout

\pdfpageattr{
  /MediaBox [0 0 360 360]
  /BleedBox [0 0 360 360]
  /CropBox [9 9 351 351]
  /TrimBox [9 9 351 351]
}

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
  \setlength{\parskip}{1em}%
  \linespread{1.0}\selectfont
}{%
  \end{center}%
}

\newenvironment{copyrightenv}{%
  \newpage%
  \raggedright%
  \flushbottom%
  \small%
  \setlength{\parskip}{0.4em}%
  \linespread{0.5}\selectfont%
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

% Turn off section numbering
\setsecnumdepth{part}

%
% Last bits...
%

% Fixes overflows; must be loaded last
\RequirePackage[final,babel=true]{microtype}
