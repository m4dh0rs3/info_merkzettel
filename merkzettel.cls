\ProvidesClass{merkzettel}[2022/11/13 Merkzettel]

% LOAD MEMOIR CLASS
%%%%%%%%%%%%%%%%%%%

% Pass Options through to the memoir class
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{memoir}
}

% Execute all called option definitions.
\ProcessOptions
\relax

% Setup memoir class properties.
\LoadClass[
  % Font for smaller text sizes.
  9pt,
  % Paper orientation in landscape mode.
  landscape,
  % Use A4 paper stock.
  a4paper,
  % Support for the German language.
  ngerman,
]{memoir}

% OPTIONS
%%%%%%%%%

\newif\ifPoster
\Postertrue

\newif\ifBooklet
\Bookletfalse

\newif\ifUniLeipzig
\UniLeipzigtrue

\newif\ifClassy
\Classyfalse

\newif\ifExtract
\Extractfalse

\DeclareOption{poster}{
  \Postertrue
  \Bookletfalse
}

\DeclareOption{booklet}{
  \Booklettrue
  \Posterfalse
}

\DeclareOption{uniLeipzig}{
  \UniLeipzigtrue
  % \Postertrue
  % \Bookletfalse
}

\DeclareOption{classy}{
  \Classytrue
  \UniLeipzigfalse
}

\DeclareOption{extract}{
  \Extracttrue
}

% Execute all called option definitions.
\ProcessOptions
\relax

% DOCUMENT METADATA
%%%%%%%%%%%%%%%%%%%

\title{Merkzettel Informatik Bachelor of Science}
\author{Benedikt Schöps (@m4dh0rs3) <schoeps.benedikt@gmail.com>}

% Set meta-data of the cheatsheet.
\RequirePackage[xetex,
    pdfauthor={\@author},
    pdfcreator={\@author},
    pdftitle={\@title},
    pdfsubject={Informatik Bachelor of Science, Universität Leipzig (Analysis, Diskrete Strukturen, Algorithmen und Datenstrukturen, Modellierung und Programmierung, Technische Informatik)},
    pdfkeywords={Informatik, Computer science, Cheatsheet, Merkzettel, Universität Leipzig, Benedikt Schöps, m4dh0rs3},
    pdfproducer={LaTeX, Latexmk, TeX Live, memoir, TikZ, VSCode LaTeX Workshop},
    baseurl={https://github.com/m4dh0rs3/info_merkzettel/},
    pdfcenterwindow=true,
    pdfdisplaydoctitle=true,
    pdffitwindow=true,
    pdflang=de,
    colorlinks=true,
]{hyperref}

% \author{Benedikt Schöps (\texttt{@m4dh0rs3}) \texttt{<\href{mailto:schoeps.benedikt@gmail.com}{schoeps.benedikt@gmail.com}>}}

% PACKAGES
%%%%%%%%%%

% FONTS
%------

% T1 text encoding support German special characters.
% European-style quoting ,,quote´´.
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman]{babel}

% UTF-8 Unicode encoding.
\RequirePackage[utf8]{inputenc}

% \RequirePackage{fontspec}

% Dingbat symbols.
\RequirePackage{pifont}

\ifUniLeipzig
  % Latin modern font sans serif.
  \RequirePackage{lmodern}
  \renewcommand{\familydefault}{\sfdefault}
  % Use round item bullets instead.
  \renewcommand{\labelitemi}{$\bullet$}
\else
  % Palatino font.
  \RequirePackage{palatino}
\fi

% MATH
%-----

% Better math support.
\RequirePackage{
  amsmath,
  amsthm,
  amsfonts,
  amssymb,
  mathtools,
}

% Source-code
%------------

% Format algorithms.
\RequirePackage{algorithm2e}
\SetAlFnt{\tiny}
\SetArgSty{oldEmph}

% \RequirePackage{pseudo}

% Source code highlighting.
% Requirers at least Python 2.6 and Pygments.
\RequirePackage{minted}

\setminted{
  breaklines,
  autogobble,
  frame={lines},
  % framerule={0.8pt},
  fontsize={\footnotesize}
}

\ifUniLeipzig
  \setminted{
    % TODO: Custom style.
    style=xcode
  }
\else
  \setminted{style=bw}
\fi

% GRAPHICS
%---------

% Draw vector graphics.
\RequirePackage{tikz}

% More geometric shapes.
\usetikzlibrary{shapes.geometric}

% Line decorations.
\usetikzlibrary{decorations.pathmorphing}

% Draw matrices.
\usetikzlibrary{matrix}

% Calculate values on the fly.
% \usetikzlibrary{calc}

% Draw graphs.
% \usetikzlibrary{graphs}
% \usetikzlibrary{graphdrawing}
% \usegdlibrary{trees}

% Draw circuits.
\RequirePackage{circuitikz}

% Circuit settings.
\ctikzset{
  % Use ANSI/IEEE Std 91/91a-1991.
  logic ports=ieee,
}

% Coordinate systems.
% \RequirePackage{tkz-euclide}

% Color definitions.
\RequirePackage{xcolor}

% LAYOUT
%-------

% Table formatting.
\RequirePackage{tabularray}

% Sideways text in table cell.
\RequirePackage{rotating}

% Layout of item environments.
\usepackage[shortlabels]{enumitem}

\ifPoster
  % Multiple columns for dense information presentation
  \RequirePackage{multicol}
\fi

\ifExtract
  % Extract important content.
  \RequirePackage[
    active,
    generate=info_merkzettel_wichtig,
    extract-env=mzImportant,
    % Not a standalone LaTeX document.
    copydocumentclass=false,
    % handles=false,
  ]{extract}

  \begin{extract}
    \documentclass[uniLeipzig]{merkzettel}
  \end{extract}
\fi

% COLORS
%%%%%%%%

\ifUniLeipzig
  % Universität Leipzig corporate design. See
  % <https://gitea.math.uni-leipzig.de/hellmund/leipzig-theme/src/commit/a0b89c43e7c6d2e5499db484fe855137adb37a3f/beamerthemeleipzig.sty#L188-L192>
  % leipzigDarkRed.
  \definecolor{primary}{HTML}{b02f2c}
  % leipzigLightBlue.
  \definecolor{secondary}{HTML}{8ac2d1}
  % leipzigLightRed.
  \definecolor{tertiary}{HTML}{d64242}
  % leipzigLightBlue
  \definecolor{background}{HTML}{8ac2d1}
\else
  % Color definitions.
  \definecolor{primary}{named}{violet}
  \definecolor{secondary}{named}{primary}
  \definecolor{background}{named}{lightgray}
\fi

% Set PDF colors.
\hypersetup{
  linkcolor=primary,
  anchorcolor=primary,
  filecolor=primary,
  menucolor=primary,
  runcolor=primary,
  urlcolor=primary
}

% COMMANDS
%%%%%%%%%%

% Pretty memoir formatting commands.
% \chapterprecis{chapter summary}
% \fancybreak{break characters}
% \epigraph{text}{author}

% Set `\fancybreak` with Dingbat symbols.
\newcommand{\mzBreak}{\fancybreak{\ding{167}\quad\ding{167}\quad\ding{167}}}

% Mark important content for the extract option.
\newenvironment{mzImportant}{}{}

% Floor and ceiling math functions.
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

\ifClassy
  % Common underline style specifically for sections.
  \newcommand{\secUnderline}[1]{\filbreak#1\vskip2ex{\color{primary}\hrule}}

  \newcommand{\centerText}[1]{{\centering#1}}
\fi

% Resize and position inline graphics.
\newcommand{\mzInline}[1]{
  \raisebox{-.5ex}{
    \resizebox{!}{2ex}{#1}
  }
}

% Position and resize graphics.
\newcommand{\mzScale}[2]{
  \begin{center}
    \resizebox{#1\linewidth}{!}{%
      #2
    }
  \end{center}
}

% Position and resize page graphics.
\newcommand{\mzGraphic}[1]{\mzScale{1}{#1}}

% Color formatting.
\let\oldEmph\emph
\renewcommand{\emph}[1]{\oldEmph{\color{secondary}#1}}

\let\oldMathbf\mathbf
\renewcommand{\mathbf}[1]{\mathbin{\color{secondary}\oldMathbf{#1}}}

\let\oldBoldsymbol\boldsymbol
\renewcommand{\boldsymbol}[1]{\mathbin{\color{secondary}\oldBoldsymbol{#1}}}

% LAYOUT
%%%%%%%%

% Set chapter-style.
\ifUniLeipzig
  \setlength{\beforechapskip}{\beforesecskip}
  \setlength{\afterchapskip}{\aftersecskip}
  \renewcommand\printchaptername{\color{background}}
\else
  \chapterstyle{wilsondob}
\fi

% Set margins of item environments and paragraphs.
\setlength{\parindent}{1em}

\setlist{
  leftmargin=1em,
  itemsep=1ex,
}
\ifUniLeipzig
  \setlist[description]{font=\itshape}
\else
  \setlist[description]{font=\normalfont\scshape}
\fi

\ifUniLeipzig
  \setsecheadstyle{\Large\bfseries\color{primary}}
  \setsubsecheadstyle{\large\bfseries\color{primary}}
\else
  \setsecheadstyle{\Large\bfseries\color{primary}\centerText}
  \setsubsecheadstyle{\large\bfseries\color{primary}\centerText}
\fi

\ifPoster
  % Background pictures.
  \RequirePackage{eso-pic}
  
  \ifUniLeipzig
    % Universität Leipzig corporate design. See
    % <https://gitea.math.uni-leipzig.de/hellmund/leipzig-theme/src/commit/a0b89c43e7c6d2e5499db484fe855137adb37a3f/beamerthemeleipzig.sty#L402-L415>.
    \AddToShipoutPictureBG{
      \hbox to \paperwidth{
        \hfill
        \begin{tikzpicture}[scale=1/16]
          % Rendered redundant parts for less color-fringing.
          \path [fill=background] (0,0) -- (24,0) -- (24,12) -- cycle;
          \path [fill=primary] (24,12) -- (40,12) -- (40,60) -- cycle;
          \path [fill=tertiary] (20,0) -- (40,0) -- (40,20) -- (24,12) -- cycle;
        
          % Author.
          % \draw (40,3) node[scale=0.7,left] {\tiny \@author, \today};
        \end{tikzpicture}
      }
    }
  \else
    \AddToShipoutPictureBG{
      \hbox to \paperwidth{
        \hfill
        \begin{tikzpicture}[scale=1/16]
          % Author.
          \draw node[scale=0.7,left] {\tiny\color{background} \@author, \today};
        \end{tikzpicture}
      }
    }
  \fi

  % POSTER LAYOUT 
  %--------------

  % Set margins.
  % Safe margin of at least 1/4" for most printers.
  \newlength{\mzOuterMargin}
  \setlength{\mzOuterMargin}{7mm}

  \newlength{\mzInnerMargin}
  \setlength{\mzInnerMargin}{3mm}

  % Set margins.
  \setlength{\columnsep}{\mzInnerMargin}
  
  \setlrmarginsandblock{\mzOuterMargin}{\mzOuterMargin}{*}
  \setulmarginsandblock{\mzOuterMargin}{\mzOuterMargin}{*}

  % Remove headers and page numbering.
  \pagestyle{empty}
  \pagenumbering{gobble}

  % Don't start new page on poster.
  \renewcommand{\clearforchapter}{}

  % Fix removed header warnings.
  \setlength{\headheight}{0pt}
  \setlength{\footskip}{0pt}

  % Remove chapter and section numbering.
  \setcounter{secnumdepth}{0}
  \renewcommand{\printchapternum}{\hfill}

  % Set multicolumn layout.
  % \setlength{\columnseprule}{.1pt}
  % \def\columnseprulecolor{\color{background}}
  \AtBeginDocument{\begin{multicols*}{5}}
  \AtEndDocument{\end{multicols*}}
\else
  % BOOKLET LAYOUT
  %---------------

  % Set stock width to third and height to half of A4 paper.
  % \stockheight=148.5mm\stockwidth=70mm
  \stockheight=297mm\stockwidth=70mm
  \settrimmedsize{\stockheight}{\stockwidth}{*}

  % Set margins.
  \setlrmarginsandblock{5mm}{5mm}{*}
  \setulmarginsandblock{14mm}{14mm}{*}

  % Ruled header style.
  % \copypagestyle{ruledColor}{ruled}
  % % \makeheadfootruleprefix{ruledColor}{\color{primary}}{\color{primary}}
  % \makeevenfoot{ruledColor}{\color{primary}\thepage}{}{}
  % \makeoddfoot{ruledColor}{}{}{\color{primary}\thepage}
  % \pagestyle{ruledColor}
  \pagestyle{ruled}

  % Use indexing.
  \makeindex

  % Print ToC at beginning of document.
  \AtBeginDocument{
    % \begin{titlingpage}
    %   \thispagestyle{empty}
    %   \rotatebox{45}{
    %     \begin{minipage}{\linewidth}
    %       % \fontsize{25}{30}
    %       % \selectfont
    %       {\HUGE info}\\
    %       \normalsize
    %       Merkzettel\\
    %       Benedikt Schöps
    %     \end{minipage}
    %   }
    % \end{titlingpage}
    % \newpage
    \tableofcontents
  }
  % Print index keywords at end of document.
  \AtEndDocument{
    \clearforchapter
    \tiny
    \printindex
  }

  \hypersetup{pdfpagelayout=TwoPageRight}
\fi

\checkandfixthelayout
\endinput