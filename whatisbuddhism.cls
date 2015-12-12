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
  \newcommand{\makeheader}[1]{%
    \ifnumequal{\value{page}}{1}{}{%
    \ifnumequal{\value{page}}{5}{}{%
    \ifnumequal{\value{page}}{6}{}{%
    \ifnumequal{\value{page}}{7}{%
      \makeorientedheader{#1}{Meditation}}{%
    \ifnumequal{\value{page}}{10}{%
      \makeorientedheader{#1}{The Four Noble Truths}}{%
    \ifnumequal{\value{page}}{12}{}{%
    \ifnumequal{\value{page}}{15}{}{%
    \ifnumequal{\value{page}}{16}{%
      \makeorientedheader{#1}{Rebirth}}{%
    \ifnumequal{\value{page}}{17}{%
      \makeorientedheader{#1}{Do Buddhists Believe in God?}}{%
    \ifnumequal{\value{page}}{18}{%
      \makeorientedheader{#1}{The Delusion of a Permanent Self or Soul}}{%
    \ifnumequal{\value{page}}{19}{%
      \makeorientedheader{#1}{The Buddhist Monastic Order}}{%
    \ifnumequal{\value{page}}{21}{%
      \makeorientedheader{#1}{Types of Buddhism}}{%
    \makeorientedheader{#1}{%
      \ifstrequal{#1}{odd}{\rightmark}{\leftmark}%
    }}}}}}}}}}}}}%
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
  \newcommand{\makeheader}[1]{%
    \ifnumequal{\value{page}}{1}{}{%
    \ifnumequal{\value{page}}{5}{%
      \makeorientedheader{#1}{The Buddha}}{%
    \ifnumequal{\value{page}}{6}{%
      \makeorientedheader{#1}{A Path of Inquiry}}{%
    \ifnumequal{\value{page}}{8}{%
      \makeorientedheader{#1}{Meditation}}{%
    \ifnumequal{\value{page}}{11}{%
      \makeorientedheader{#1}{The Four Noble Truths}}{%
    \ifnumequal{\value{page}}{13}{%
      \makeorientedheader{#1}{The Middle Way}}{%
    \ifnumequal{\value{page}}{17}{%
      \makeorientedheader{#1}{The Law of Kamma}}{%
    \ifnumequal{\value{page}}{19}{}{%
    \ifnumequal{\value{page}}{21}{%
      \makeorientedheader{#1}{The Delusion of a Permanent Self or Soul}}{%
    \ifnumequal{\value{page}}{23}{}{%
    \ifnumequal{\value{page}}{24}{%
      \makeorientedheader{#1}{Types of Buddhism}}{%
    \makeorientedheader{#1}{%
      \ifstrequal{#1}{odd}{\rightmark}{\leftmark}%
    }}}}}}}}}}}}%
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
  \newcommand{\makeheader}[1]{%
    \ifnumequal{\value{page}}{1}{}{%
    \ifnumequal{\value{page}}{5}{%
      \makeorientedheader{#1}{The Buddha}}{%
    \ifnumequal{\value{page}}{6}{%
      \makeorientedheader{#1}{A Path of Inquiry}}{%
    \ifnumequal{\value{page}}{8}{%
      \makeorientedheader{#1}{Meditation}}{%
    \ifnumequal{\value{page}}{11}{%
      \makeorientedheader{#1}{The Four Noble Truths}}{%
    \ifnumequal{\value{page}}{13}{%
      \makeorientedheader{#1}{The Middle Way}}{%
    \ifnumequal{\value{page}}{17}{%
      \makeorientedheader{#1}{The Law of Kamma}}{%
    \ifnumequal{\value{page}}{19}{}{%
    \ifnumequal{\value{page}}{21}{%
      \makeorientedheader{#1}{The Delusion of a Permanent Self or Soul}}{%
    \ifnumequal{\value{page}}{23}{}{%
    \ifnumequal{\value{page}}{24}{%
      \makeorientedheader{#1}{Types of Buddhism}}{%
    \makeorientedheader{#1}{%
      \ifstrequal{#1}{odd}{\rightmark}{\leftmark}%
    }}}}}}}}}}}}%
  }%
  \newcommand{\setdocumentdimensions}{%
    \settypeblocksize{90mm}{90mm}{*}
  }%
  \newcommand{\settitlespacing}{%
    % More spacing
    \titlespacing*{\section}{0pt}{4em}{2em}%
  }%
  \newcommand{\preparehyphenation}{%
    % Enable hyphenation (default) for spaced booklet
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
\setdocumentdimensions
\settrims{0pt}{0pt}
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

\newcommand{\makeorientedheader}[2]{%
  \headerstyle%
  \ifstrequal{#1}{odd}{%
    #2%
    \sepdot%
    \thepage%
  }{% even
    \thepage%
    \sepdot%
    #2%
  }%
}

% Show section name and page number for both odd and even headers
\makepagestyle{mainpagestyle}
\makeoddhead{mainpagestyle}{}{}{\makeheader{odd}}
\makeevenhead{mainpagestyle}{\makeheader{even}}{}{}

% Suppress footers
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
