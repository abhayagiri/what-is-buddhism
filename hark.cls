% Hark Class
%
% A document class for small booklets or quote collections.
%
% https://github.com/profound-labs/hark
%
% http://profound-labs.github.io/projects/hark/
%
% (c) Gambhiro Bhikkhu, 2013
% gambhiro@ratanagiri.org.uk
%
% LPPL LaTeX Pubic Project Licence
%

% ==============
% Identification
% ==============

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hark}[2013/04/13 v0.4 A document class for small booklets or quote collections.]

% ========================
% Preliminary Declarations
% ========================

% =======
% Options
% =======

\RequirePackage{pgfopts}
\RequirePackage{calc}

\pgfkeys{
  /GIST/.cd,
  pagePreset/.default=widepocket,% widepocket: 135x120mm
  pagePreset/.store in=\GIST@pagePreset,
  textType/.default=prose,% prose / quoteAndComment
  textType/.store in=\GIST@textType,
  babelLanguage/.default=USenglish,
  babelLanguage/.store in=\GIST@babelLanguage,
}

% Pass all unknown options to memoir
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\ProcessPgfOptions{/GIST}
\ProcessOptions\relax

% ======================
% All Other Declarations
% ======================

% Load packages here, unless there it makes more sense to load it
% later.

\LoadClass[11pt,twoside]{memoir}

\RequirePackage[\GIST@babelLanguage]{babel}

\RequirePackage{nag}
\RequirePackage{xparse}
\RequirePackage{soul}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage[cmyk]{xcolor}

\RequirePackage{graphicx}
\graphicspath{{./src-images/}}
\RequirePackage{eso-pic}
\RequirePackage{ccicons}
\RequirePackage{multicol}
\RequirePackage{ifthen}
\RequirePackage{titletoc}
\RequirePackage{enumitem}

\RequirePackage{tikz}
% load tikz libraries here
% ...

% === Define colors ===

\definecolor{textbody}{gray}{0.15}
\definecolor{footnoterule}{gray}{0.5}
\definecolor{chapternum}{gray}{0.8}
\definecolor{chaptertitle}{gray}{0.3}
\definecolor{chapterauthor}{gray}{0.3}
\definecolor{chapternote}{gray}{0.3}
\definecolor{section}{gray}{0.3}
\definecolor{tocleftside}{gray}{0.5}
\definecolor{header}{gray}{0.4}

% === Load fonts ===

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures={TeX}}

% If -- dashes don't work for your font, try
% Renderer = Basic
% http://tex.stackexchange.com/questions/20580/how-to-enable-ligatures-for-emdash-endash-in-luatex

% === fonts for prose textType ===

\ifthenelse{\equal{\GIST@textType}{prose}}{

% body text

\setmainfont[
  SmallCapsFont = Gentium Book Basic,
  SmallCapsFeatures= { Ligatures = TeX, Letters = SmallCaps },
  BoldFont = Gentium Book Basic Bold,
]{Gentium}

% header and footer

\newfontfamily\headFont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

\newfontfamily\footFont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

% chapter

\newfontfamily\chapterNameFont{Crimson Text}
\newfontfamily\chapterTitleFont{Crimson Text}
\newfontfamily\chapterNumberFont{Crimson Text}
\newfontfamily\chapterAuthorFont{Crimson Text}
\newfontfamily\chapterNoteFont[
  BoldFont = Crimson Text Semibold,
  ItalicFont = Crimson Text Italic,
]{Crimson Text}

% section

\newfontfamily\sectionFont[
  BoldFont = Crimson Text Semibold,
  ItalicFont = Crimson Text Italic,
]{Crimson Text}

% other fonts

\newfontfamily\tocPageNumFont{Liberation Sans}

}{}

% === fonts for quoteAndComment textType ===

\ifthenelse{\equal{\GIST@textType}{quoteAndComment}}{

% body text

\setmainfont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

% header and footer

\newfontfamily\footFont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

% chapter

\newfontfamily\chapterNameFont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

\newfontfamily\chapterTitleFont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

\newfontfamily\chapterNumberFont{Liberation Sans}
\newfontfamily\chapterAuthorFont{Liberation Sans}
\newfontfamily\chapterNoteFont{Liberation Sans}

% section

\newfontfamily\sectionFont{Liberation Sans}

% other fonts

\newfontfamily\tocPageNumFont{Liberation Sans}

}{}

% === fonts by name ===

\newfontfamily\crimsonRomanFont[
  BoldFont = Crimson Text Semibold,
  ItalicFont = Crimson Text Italic,
]{Crimson Text}

\newfontfamily\crimsonRomanFontOldNum[
  Numbers = OldStyle,
]{Crimson Text}

\newfontfamily\gentiumFont{Gentium}

\newfontfamily\shakerFont[
  ItalicFont = Liberation Sans Italic,
  Renderer = Basic,
]{Liberation Sans}

% === sizes ===

\newcommand{\footSize}
  {\@setfontsize\footSize{9}{9}}
\newcommand{\headSize}
  {\@setfontsize\footSize{9}{9}}
\newcommand{\chapterNameSize}
  {\@setfontsize\chapterNameSize{22}{24}}
\newcommand{\chapterNumberSize}
  {\@setfontsize\chapterNumberSize{22}{24}}
\newcommand{\chapterTitleSize}
  {\@setfontsize\chapterTitleSize{13}{16.5}}
\newcommand{\chapterAuthorSize}
  {\@setfontsize\chapterAuthorSize{12}{14}}
\newcommand{\chapterNoteSize}
  {\@setfontsize\chapterNoteSize{10}{13}}
\newcommand{\sectionSize}
  {\@setfontsize\sectionSize{13}{15}}
\newcommand{\smaller}
  {\@setfontsize\smaller{9}{11}}

%\newcommand{\footsize}{\@setfontsize\footsize{10}{14.5}}
%\newcommand{\chapnamesize}{\@setfontsize\chapnamesize{22}{24}}
%\newcommand{\chaptitlesize}{\@setfontsize\chaptitlesize{13}{20}}
%\newcommand{\sectiontitlesize}{\@setfontsize\sectiontitlesize{11.5}{18}}

\newcommand{\copyrightsize}{\@setfontsize\copyrightsize{7}{9}}

\newcommand{\dhpversesize}{\@setfontsize\dhpversesize{12}{15.5}}

% === Page geometry and layout ===

% Symbols used:
% P = page proportion (h/w)
% T = textblock proportion (d/m)
% w = paper width
% h = paper height
% m = text width
% d = text height

%\RequirePackage{geometry}
%\geometry{
%paperwidth=135mm,
%paperheight=120mm,
%lines=17,
%top=15mm,
%bottom=15mm,
%textwidth=100mm,
%outer=15mm
%}
%\setlength{\stockwidth}{135mm}
%\setlength{\stockheight}{120mm}

% P = 1.125, 8:9, major 2nd
% T = ? 1.067 15:16, minor 2nd
% ? 1.082, Tall Cross Octagon
% ? 1.051, Turned Pentagon
% 100/x
% 95/88

% prose: e = 18mm, t=15mm, f=23mm, ht=7mm, hs=7mm, he=6mm, hw=23mm
% verses w/ reflections: center v h

\ifthenelse{\equal{\GIST@pagePreset}{widepocket}}{

  % Wide Pocket
  %
  % 135mm x 120mm page
  % P = 0.888
  % T = 88 / 95 = 0.926 ?

  % === normalsize ===

  \renewcommand{\normalsize}{%
    \@setfontsize\normalsize\@xipt{13.6}%
    \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
    \abovedisplayshortskip \z@ \@plus3\p@
    \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \color{textbody}
  \let\@listi\@listI}
  \normalsize

  % === indentations ===

  \setlength{\vgap}{1.5em}
  \setlength{\vindent}{\vgap}
  \setlength{\vleftmargin}{2em}

  \setlength{\parindent}{17pt}
  \setlength{\parskip}{0pt}

  % === setup page layout ===

  \setstocksize{120mm}{135mm}% 8/9, 1.125
  \settrimmedsize{\stockheight}{\stockwidth}{*}
  \settrims{0pt}{0pt}
  \settypeblocksize{17\baselineskip + \topskip}{*}{1.155}% pi/e
  \setlrmargins{*}{*}{1.125}% major 2nd
  \setulmargins{*}{*}{1.778}% minor 7th 9:16
  \setheaderspaces{*}{4mm}{*}

  \checkandfixthelayout

}{
  % \ldots
}

% === hyperref ===

\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  unicode=true,
  linkcolor=textbody,
  citecolor=textbody,
  filecolor=textbody,
  urlcolor=textbody
}
\RequirePackage[
  open,
  openlevel=2
]{bookmark}

% memoir's more allowing penalties
\midsloppy

% \renewcommand\britishhyphenmins{{3}{3}}

% lastparline:
%   ``Ensures that the last line of a paragraph is at least as long as the
%   double value of \parindent. When LuaTEX is used, the solution provided
%   by Patrick Gundlach is used. With other rendering engines, it is the
%   native solution provided by Enrico Gregorio that serves as an
%   implementation.''
% http://tex.stackexchange.com/questions/28357/ensure-minimal-length-of-last-line/

% Load with draft option to visualize inserted nobreaks.
\RequirePackage[lastparline]{impnattypo}

% Alternatively, egreg's native solution:
% http://tex.stackexchange.com/a/28358/831
%\setlength{\parfillskip}{0pt plus\dimexpr\textwidth-2\parindent}

% Last line at least 20% of textwidth
%\parfillskip 0pt plus 0.8\textwidth

\hyphenpenalty=700
\exhyphenpenalty=50
\doublehyphendemerits=900
\brokenpenalty=990

\RequirePackage[defaultlines=2,all]{nowidow}

% === common hyphenation exceptions and corrections ===

\hyphenation{season wisdom develop-ment respon-sible pheno-mena
philo-sophical munindo}

%\hyphenation{accur-ately argu-men-ta-tive attach Ayu-dhaya becomes
%ben-e-fi-cial capa-bil-ity car-ry car-ry-ing cere-monies cere-mony
%ces-sa-tion chal-lenge chal-leng-ing clas-si-fi-ca-tion
%clas-si-fi-ca-tions clas-si-fied com-mu-nity con-di-tion
%con-di-tioned con-struc-tions con-tem-plate con-tem-plat-ing
%con-tem-pla-tion cul-ti-vate cul-ti-vates cul-ti-vat-ing
%cul-ti-vation def-i-ni-tion de-ter-mine de-ter-mined dhamma dhammas
%dis-cern-ment dis-con-tent dis-cur-sive dying em-pha-size
%enlight-ened equa-nim-ity es-pe-cial-ly estab-lish exist-ence
%ex-pe-ri-ence hap-pen-ing having ig-no-rance immedi-ately
%im-per-ma-nent in-nu-mer-a-ble in-se-cu-ri-ty in-spir-ing
%in-struct-ed in-ves-ti-gate in-ves-ti-ga-tion iso-late iso-lat-ed
%Keuan lay-peo-ple ma-te-ri-al mat-u-ra-tion medi-tate medi-ta-tion
%medi-ta-tive mental mon-as-teries mon-as-tery Nana-chat or-dain
%or-dain-ed or-di-na-tion orig-inate oth-er-wise pene-trat-ing
%per-son-al per-son-al-ity phe-nom-e-na phe-nom-e-non po-si-tion
%pow-er pow-ers pre-vi-ous pro-lif-er-ate pro-lif-er-ating
%pro-lif-er-a-tions puthu-jjana quest-ion rec-i-ta-tion
%sat-is-fac-tory sen-sa-tion sen-sa-tions sim-i-lar suf-fer-ing
%sup-po-si-tion syn-on-y-mous tem-per-a-ment tem-per-a-ments tong-rat
%tran-scend tran-scend-ent tran-scends un-con-di-tioned under-stand
%under-stood un-hap-pi-ness un-sat-is-fac-tori-ness un-sat-is-fac-tory
%ven-er-able wea-ri-ness what-ev-er when-ever wher-ever whole-hearted
%whole-heart-edly wrong-do-ing}

% === soul settings ===

\sodef\soTocChapter{}{.1em}{.5em plus.1em}{.1em plus.1em minus.1em}
\sodef\soSection{}{.07em}{.4em plus.1em}{.1em plus.1em minus.1em}
\sodef\soChapter{}{.06em}{.4em plus.1em}{.1em plus.1em minus.1em}

% === Custom commands and environments ===

\newcommand{\versealign}{\centering}

\newcommand\dividerRule{%
{\centering\bigskip
{\color[gray]{0.6}\rule{0.6\linewidth}{0.2pt}}
\par\bigskip}%
}

\newcommand\emptysheet{%
  \cleardoublepage
  \thispagestyle{empty}\mbox{}\newpage
  \thispagestyle{empty}\mbox{}\newpage
}

\newcommand\emptydoublepage\emptysheet

\newcommand\emptypage{%
  \clearpage
  \thispagestyle{empty}\mbox{}\newpage
}

\newcommand*{\subtitle}[1]{\def\@thesubtitle{#1}}
\newcommand*{\editionInfo}[1]{\def\@theEditionInfo{#1}}
\newcommand*{\printedByInfo}[1]{\def\@thePrintedByInfo{#1}}
\newcommand*{\ISBN}[1]{\def\@theISBN{#1}}

\newcommand\thesubtitle{\@thesubtitle}
\newcommand\theEditionInfo{\@theEditionInfo}
\newcommand\thePrintedByInfo{\@thePrintedByInfo}
\newcommand\theISBN{\@theISBN}

\newsavebox{\quotepagebox}
\newlength{\quoteXshift}\setlength{\quoteXshift}{0mm}
%% Arguments:
%% [#1] -- xshift from page center, default 0mm
%% #2 -- width of quote
\newenvironment{quotepage}[2][0mm]
  {\setlength{\quoteXshift}{#1}
   \begin{lrbox}{\quotepagebox}\begin{minipage}{#2}
   \setlength{\parskip}{0.6\baselineskip}
   \setlength{\parindent}{0pt}}
  {\end{minipage}\end{lrbox}%
   \begin{tikzpicture}[remember picture,overlay]
   \node[xshift={\quoteXshift}] at (current page.center) {\usebox{\quotepagebox}};
   \end{tikzpicture}}

%% Arguments:
%% #1 -- verse numbers (i.e. 88-89, etc)

\newenvironment{dhpVerse}[1]
{\def\verseref{\textit{v. #1}}
\cleartoverso
\begin{minipage}[c][\textheight][c]{\textwidth}
\setlength{\parskip}{0.6\baselineskip}
\setlength{\parindent}{0pt}
\dhpversesize\versealign}
{\par\verseref
\end{minipage}}

% \newenvironment{dhpVerse}[1]
% {\def\verseref{\textit{v. #1}}
% \cleartoverso
% \begin{quotepage}[-2mm]{80mm}%
% \dhpversesize\versealign}
% {\par\verseref
% \end{quotepage}}

\newenvironment{dhpRefl}
{\cleartorecto
\begin{minipage}[c][\textheight][c]{\textwidth}
\setlength{\parskip}{0.6\baselineskip}
\setlength{\parindent}{0pt}}
{\end{minipage}}

% \newenvironment{dhpRefl}
% {\cleartorecto
% \begin{quotepage}[2mm]{105mm}}
% {\end{quotepage}}

\newenvironment{packeditemize}%
{\begin{itemize}[
  itemindent=0pt,
  leftmargin=20pt,
  rightmargin=0pt,
  itemsep=0pt,
  topsep=0pt,
  parsep=0pt,
  partopsep=3pt,
]%
}{\end{itemize}}

\def\gobble@spaces{\@ifnextchar\space{\@gobble\gobble@spaces}{}}
\newcommand{\verseref}[1]{\mbox{}\marginpar{\par\vspace*{-7pt}\oldNumFont #1.}\gobble@spaces}
\newcommand{\pali}[1]{\textit{#1}}
\newcommand{\suttaref}[1]{\hspace*{\fill}\footnotesize\begingroup #1 \endgroup\par}
\newcommand{\attrib}[1]{\nopagebreak{\raggedleft\footnotesize #1\par}}

\newlength\qw
%\setlength\qw{\widthof{\normalsize\normalfont\itshape Q:\space}}
\setlength\qw{17pt}% same as parindent for smallpage

\newcommand{\question}[1]{%
  \smallskip%
  \par\noindent\hangindent=\qw%
  \ifthenelse{\equal{#1}{}}{\textit{Q:}\space}{\textit{#1:}\space}%
}

\newcommand{\questionBi}[2]{%
  \smallskip%
  \par\noindent\hangindent=\qw%
  \textit{Q: #1}
  \smallskip%
  \par\noindent\hangindent=\qw%
  \textit{Q: #2}
}

\newcommand{\answer}[1]{%
  \smallskip%
  \par\noindent%
  \ifthenelse{\equal{#1}{}}{\textit{A:}\space}{\textit{#1:}\space}%
}

% === Renewing package macros ===

\let\mainmatterOrig=\mainmatter
\renewcommand{\mainmatter}{%
  \mainmatterOrig%
  \addtocontents{toc}{\addvspace{10pt}}%
}

\let\backmatterOrig=\backmatter
\renewcommand{\backmatter}{%
  \backmatterOrig%
  \addtocontents{toc}{\addvspace{15pt}}%
}

\renewenvironment{quote}%
{\small
\list{}{\rightmargin\leftmargin}%
\item[]}%
{\endlist}

\newcommand\quoteref[1]{%
\par
{\footnotesize #1}
\par
}

\renewcommand\footnoterule{%
  \vspace*{\baselineskip}%
  \kern-3\p@
  {\color{footnoterule}\hrule height 0.1pt width \columnwidth}
  \kern2.6\p@}

% === Page styles ===

\nouppercaseheads

% === define page styles with names about "what it does" ===

\newcommand{\sepline}{%
  \hspace{6pt}%
  \raisebox{-0.3\baselineskip}{\rule{0.2pt}{1.2\baselineskip}}%
  \hspace{6pt}%
}

\newcommand{\sepdot}{%
  \hspace*{6pt}%
  $\cdot$%
  \hspace*{6pt}%
}

% TODO: why is that 3pt offset necessary?

\makepagestyle{topcorner}
\makeevenhead{topcorner}{%
  \raggedright%
  \headFont\headSize%
  \parbox{\paperwidth - \textwidth - \spinemargin - 3pt}{\raggedleft\thepage\sepdot}{\color{header}\leftmark}%
}{}{}
\makeevenfoot{topcorner}{}{}{}
\makeoddhead{topcorner}{}{}{%
  \raggedleft%
  \headFont\headSize%
  {\color{header}\rightmark}\parbox{\paperwidth - \textwidth - \spinemargin - 3pt}{\raggedright\sepdot\thepage}%
}
\makeoddfoot{topcorner}{}{}{}
\makerunningwidth{topcorner}{\paperwidth}
\makepsmarks{topcorner}{%
  \createmark{chapter}{left}{nonumber}{}{}
  \createmark{section}{right}{nonumber}{}{}
}

\makepagestyle{bottomcenter}
\makeevenhead{bottomcenter}{}{}{}
\makeevenfoot{bottomcenter}{}{%
  \footFont\footSize%
  \thepage%
}{}
\makeoddhead{bottomcenter}{}{}{}
\makeoddfoot{bottomcenter}{}{%
  \footFont\footSize%
  \thepage%
}{}

% TODO: revise and simplify this page style. Used for the verses.
%
%\makepagestyle{normalpage}
%  \makepsmarks{normalpage}{%
%    \def\chaptermark##1{\markboth{\memUChead{##1}}{}}%
%    \def\tocmark{\markboth{\memUChead{\contentsname}}{\memUChead{\contentsname}}}%
%    \def\lofmark{\markboth{\memUChead{\listfigurename}}{\memUChead{\listfigurename}}}%
%    \def\lotmark{\markboth{\memUChead{\listtablename}}{\memUChead{\listtablename}}}%
%    \def\bibmark{\markboth{\memUChead{\bibname}}{\memUChead{\bibname}}}%
%    \def\indexmark{\markboth{\memUChead{\indexname}}{\memUChead{\indexname}}}%
%    \def\sectionmark##1{\markright{\memUChead{##1}}}}
%  \makepsmarks{normalpage}{%
%    \nouppercaseheads
%    \createmark{chapter}{left}{nonumber}{}{}
%    \createmark{section}{right}{nonumber}{}{}
%    \createplainmark{toc}{both}{\contentsname}
%    \createplainmark{lof}{both}{\listfigurename}
%    \createplainmark{lot}{both}{\listtablename}
%    \createplainmark{bib}{both}{\bibname}
%    \createplainmark{index}{both}{\indexname}
%    \createplainmark{glossary}{both}{\glossaryname}
%  }
%%  \makeevenhead{normalpage}{}{\headFont\itshape\small\thetitle}{}
%  \makeevenhead{normalpage}{}{}{}
%%  \makeoddhead{normalpage}{}{\headFont\itshape\small\leftmark}{}
%  \makeoddhead{normalpage}{}{}{}
%  \makeevenfoot{normalpage}{}{\footFont\footsize\color[gray]{0.3}\thepage}{}
%  \makeoddfoot{normalpage}{}{\footFont\footsize\color[gray]{0.3}\thepage}{}

% === alias the pagestyles into semantic names, "where it is used" ===

\aliaspagestyle{normalpage}{topcorner}
\aliaspagestyle{chapter}{bottomcenter}
\aliaspagestyle{part}{empty}
\aliaspagestyle{afterpart}{empty}

\pagestyle{normalpage}

% === TOC settings ===

\maxtocdepth{section}

\newlength{\toctopskip}
\setlength{\toctopskip}{2\baselineskip}

\renewcommand{\printtoctitle}[1]{%
  \raggedright\vspace*{\toctopskip}%
  \hspace*{17pt}\parbox{0.85\linewidth}{%
    \raggedright\chapTitleFont\chaptitlesize\MakeUppercase{\soChapter{\contentsname}}%
  }%
}

\renewcommand{\cftchapterfont}{\chapTitleFont\chaptitlesize\color{chaptitle}}
\renewcommand{\cftchapterpagefont}{\tocPageNumFont\normalsize\color{chaptitle}}
\renewcommand{\cftchapterpresnum}[1]{}
\setlength{\cftchapternumwidth}{0pt}
\renewcommand{\chapternumberline}[1]{}

\renewcommand{\cftsectiondotsep}{\cftnodots}
\renewcommand{\cftsectionpresnum}[1]{}
\setlength{\cftsectionnumwidth}{0pt}
\renewcommand{\numberline}[1]{}

\renewcommand{\cftsubsectiondotsep}{\cftnodots}
\renewcommand{\cftsubsectionpresnum}[1]{}
\setlength{\cftsubsectionnumwidth}{0pt}

% === Book styles ===

% === Part styles ===

\aliaspagestyle{book}{empty}
\aliaspagestyle{part}{empty}

\renewcommand*{\printbookname}{}
\renewcommand*{\printbooknum}{}

\renewcommand*{\beforebookskip}{\vspace*{0.5\textheight}}
\renewcommand*{\booktitlefont}{\chapNameFont\Large\color{chaptitle}}
\renewcommand*{\printbooktitle}[1]{\booktitlefont\soChapter{#1}}

\renewcommand{\partnamefont}{\booktitlefont}
\renewcommand{\partnumfont}{\booktitlefont}
\renewcommand{\parttitlefont}{\booktitlefont}
\renewcommand{\printpartname}{\partnamefont\MakeUppercase{\soChapter{\partname}}}

\renewcommand{\printparttitle}[1]{\parttitlefont\MakeUppercase{\soChapter{#1}}}

% === Chapter styles ===

\setsecnumdepth{chapter}

% define chapter styles with "fantasy" names

\newif\ifchapterauthor
\chapterauthorfalse

\newcommand*{\theChapterAuthor}{}
\newcommand*{\chapterAuthor}[1]{%
  \chapterauthortrue%
  \renewcommand*{\theChapterAuthor}{#1}%
}

\newcommand\chapterAuthorFmt[1]{%
  \chapterAuthorFont\chapterAuthorSize\color{chapterauthor}%
  #1%
}

\newif\ifchapternote
\chapternotefalse

\newcommand\chapterNoteFmt[1]{%
  \chapterNoteFont\chapterNoteSize\color{chapternote}%
  \itshape #1%
}

\newcommand*{\theChapterNote}{}
\newcommand*{\chapterNote}[1]{%
  \chapternotetrue%
  \renewcommand*\theChapterNote{#1}%
}

\newif\ifchapterfootnote
\chapterfootnotefalse

\newcommand*{\theChapterFootnoteMark}{}
\newcommand*{\theChapterFootnoteText}{}
\newcommand*{\chapterFootnote}[2][\footnotemark]{%
  \chapterfootnotetrue%
  \renewcommand*\theChapterFootnoteMark{#1}%
  \renewcommand*\theChapterFootnoteText{\footnotetext{#2}}%
}

\newlength\chapterTitleLeftSkip
\setlength{\chapterTitleLeftSkip}{17pt}

\makechapterstyle{lowtitle}{
  \chapterstyle{default}
  \setlength{\beforechapskip}{30mm}
  \setlength{\chapterTitleLeftSkip}{17pt}
  \renewcommand\printchaptername{}
  \renewcommand\chapternamenum{}
  \renewcommand\chapnumfont{\chapterNumberFont\chapterNumberSize}
  \renewcommand\printchapternum{%
    \chapnumfont\color{chapternum}%
    \hspace*{\chapterTitleLeftSkip}\thechapter%
  }
  \setlength{\midchapskip}{2\onelineskip}
  \renewcommand\afterchapternum{\par\nobreak\vskip \midchapskip}
  \renewcommand\printchapternonum{}
  \renewcommand\chaptitlefont{\chapterTitleFont\chapterTitleSize}
  \renewcommand*\printchaptertitle[1]{%
    \raggedright\hspace*{\chapterTitleLeftSkip}%
    \parbox{\linewidth - \chapterTitleLeftSkip}{%
      \raggedright\chaptitlefont\color{chaptertitle}%
      \MakeUppercase{\soChapter{##1}}%
      \ifchapterfootnote%
        \hspace*{2pt}\theChapterFootnoteMark%
      \fi%
      \ifchapterauthor%
        \vskip 0.5\onelineskip%
        \chapterAuthorFmt{\theChapterAuthor}%
        \global\chapterauthorfalse%
      \fi%
      \ifchapternote%
        \vskip 0.5\onelineskip%
        \chapterNoteFmt{\theChapterNote}%
        \global\chapternotefalse%
      \fi%
    }%
    \ifchapterfootnote%
      \theChapterFootnoteText%
      \global\chapterfootnotefalse%
    \fi%
  }
  \setlength{\afterchapskip}{2.5\onelineskip}
  \renewcommand\afterchaptertitle{\par\nobreak\vskip \afterchapskip}%
}

\makechapterstyle{hightitle}{
  \chapterstyle{lowtitle}
  \setlength{\beforechapskip}{0pt}
  \setlength{\chapterTitleLeftSkip}{6pc}
}

\makechapterstyle{nonumber}{
  \chapterstyle{lowtitle}
  \setlength{\beforechapskip}{0pt}
  \setlength{\chapterTitleLeftSkip}{4pc}
  \renewcommand\printchapternum{}
}

% alias the "fantasy" names into semantic chapter names

\chapterstyle{nonumber}

% === Section styles ===

\raggedbottomsection

\setbeforesecskip{-3.5ex \@plus -1ex \@minus -.2ex}
\setaftersecskip{2.3ex \@plus .2ex}

\newcommand\sectionFmt[1]{%
  \sectionFont\sectionSize\color{section}%
  \memRTLraggedright%
  \itshape #1%
}
\setsecheadstyle{\sectionFmt}

\setsubsecheadstyle{%
  \sectionFont\large\itshape\memRTLraggedright%
}
\setsubsubsecheadstyle{%
  \sectionFont\normalsize\itshape\memRTLraggedright%
}

% === Packages to be loaded LAST ===

\RequirePackage[perpage,multiple,stable]{footmisc}

\RequirePackage[final,babel=true]{microtype}

%% =================
%% PDF/X-3:2002 info
%% =================

% \pdfobjcompresslevel=0%
% \pdfminorversion=3%
% \pdfinfo{
%   /Title (Dhammapada)
%   /Author (Forizs Laszlo)
%   /Subject (buddhizmus)
%   /Keywords (buddhizmus)
%   /GTS_PDFXVersion (PDF/X-3:2002)
% }%
% \pdfpageattr{
% /MediaBox [0 0 369.00000 594.00000]
% /BleedBox [0.00000 0.00000 369.00000 594.00000]
% /CropBox [0 0 369.00000 594.00000]
% /TrimBox [0.00000 0.00000 369.00000 594.00000]
% }
% \pdfcatalog{
%   /PageMode /UseNone
%   /OutputIntents [ <<
%     /Info (none)
%     /Type /OutputIntent
%     /S /GTS_PDFX
%     /OutputConditionIdentifier (Blurb.com)
%     /RegistryName (http://www.color.org/)
%   >> ]
% }%

%% ==============
