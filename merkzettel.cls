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
  \Postertrue
  \Bookletfalse
}

\DeclareOption{classy}{
  \Classytrue
  \UniLeipzigfalse
}

% Execute all called option definitions.
\ProcessOptions
\relax

% DOCUMENT METADATA
%%%%%%%%%%%%%%%%%%%

\title{Merkzettel Informatik Bachelor of Science}
\author{Benedikt Schöps @m4dh0rs3 <schoeps.benedikt@gmail.com>}

% Set meta-data of the cheatsheet.
\RequirePackage[xetex,
    pdfauthor={\@author},
    pdfcreator={\@author},
    pdftitle={\@title},
    pdfsubject={Informatik Bachelor of Science, Universität Leipzig (Analysis, Diskrete Strukturen, Algorithmen und Datenstrukturen, Modellierung und Programmierung, Technische Informatik)},
    pdfkeywords={Informatik, Computer science, Cheatsheet, Merkzettel, Universität Leipzig, Benedikt Schöps, m4dh0rs3},
    pdfproducer={LaTeX, Latexmk, TeX Live, memoir, TikZ, VSCode LaTeX Workshop},
    baseurl={m4dh0rs3.github.io/},
    pdfcenterwindow=true,
    pdfdisplaydoctitle=true,
    pdffitwindow=true,
    pdflang=de,
]{hyperref}

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

% Line decorations.
\usetikzlibrary{decorations.pathmorphing}

% Draw matrices.
\usetikzlibrary{matrix}

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

\ifUniLeipzig
  % Background pictures.
  \RequirePackage{eso-pic}

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
        % \draw[white] (30,3) node[scale=0.7] {\tiny Benedikt Schöps};
      \end{tikzpicture}
    }
  }
\fi

% LAYOUT
%-------

% Table formatting.
\RequirePackage{tabularray}

\ifPoster
  % Multiple columns for dense information presentation
  \RequirePackage{multicol}
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

% Floor and ceiling math functions.
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

\ifClassy
  % Common underline style specifically for sections.
  \newcommand{\secUnderline}[1]{#1\vskip2ex{\color{primary}\hrule}}
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

\ifPoster
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

  \ifUniLeipzig
    \setsecheadstyle{\Large\bfseries\color{primary}}
    \setsubsecheadstyle{\large\bfseries\color{primary}}
  \else
    % Extend chapter, sub-/section style with underline.
    \setsecheadstyle{\Large\bfseries\secUnderline}
    \setsubsecheadstyle{\large\bfseries\secUnderline}
  \fi

  % Fix removed header warnings.
  \setlength{\headheight}{0pt}
  \setlength{\footskip}{0pt}

  % Remove chapter and section numbering.
  \setcounter{secnumdepth}{0}
  \renewcommand{\printchapternum}{\hfill}

  % Set multicolumn layout.
  \AtBeginDocument{\begin{multicols*}{5}}
  \AtEndDocument{\end{multicols*}}
\else
  % BOOKLET LAYOUT
  %---------------

  % Set stock width to third and height to half of A4 paper.
  \stockheight=148.5mm\stockwidth=70mm
  % \stockheight=297mm\stockwidth=140mm
  \settrimmedsize{\stockheight}{\stockwidth}{*}

  % Set margins.
  \setlrmarginsandblock{5mm}{5mm}{*}
  \setulmarginsandblock{14mm}{14mm}{*}

  % Ruled header style.
  \pagestyle{ruled}

  % Use indexing.
  \makeindex

  \ifUniLeipzig
    \setsecheadstyle{\filbreak\Large\bfseries\color{primary}}
    \setsubsecheadstyle{\filbreak\large\bfseries\color{primary}}
  \else
    % Extend chapter, sub-/section style with underline.
    \setsecheadstyle{\filbreak\Large\bfseries\secUnderline}
    \setsubsecheadstyle{\filbreak\large\bfseries\secUnderline}
  \fi

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
    \printindex
  }

  \hypersetup{pdfpagelayout=TwoPageRight}
\fi

\checkandfixthelayout
\endinput