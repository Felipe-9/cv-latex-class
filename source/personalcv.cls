\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{personalcv}[2025-07-16 personal curriculum vitae and letter document class]

% process given options
\ProcessOptions\relax

%% Apply size
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{xparse}

\RequirePackage{ifthen}

%% INFO: colors
\RequirePackage{xcolor}

\definecolor{foreground}{named}{black}
\definecolor{background}{named}{white}

\definecolor{accent-0}{HTML}{001b17} % #001b17
\definecolor{accent-1}{HTML}{005146} % #005146
\definecolor{accent-2}{HTML}{148e7c} % #148e7c
\definecolor{accent-3}{HTML}{55cbb7} % #55cbb7
\definecolor{accent-4}{HTML}{71e5cf} % #71e5cf
\definecolor{accent-5}{HTML}{8cffe9} % #8cffe9
\definecolor{accent-6}{HTML}{e3fef8} % #e3fef8
\definecolor{accent}{named}{accent-2} % #148e7c

\definecolor{grey-0}{HTML}{111621} % #111621
\definecolor{grey-1}{HTML}{3f4552} % #3f4552
\definecolor{grey-2}{HTML}{747a88} % #747a88
\definecolor{grey-3}{HTML}{aeb4c4} % #aeb4c4
\definecolor{grey-4}{HTML}{c7cddd} % #c7cddd
\definecolor{grey-5}{HTML}{e0e6f7} % #e0e6f7
\definecolor{grey-6}{HTML}{f3f7ff} % #f3f7ff
\definecolor{grey}  {named}{grey-2} % #3f4552

% \definecolor{link}{HTML}{0b1b08} % #0b1b08
% \definecolor{link}{HTML}{2c4f25} % #2c4f25
\definecolor{link}{HTML}{518b45} % #518b45
% \definecolor{green-0}{HTML}{0b1b08} % #0b1b08
% \definecolor{green-1}{HTML}{2c4f25} % #2c4f25
% \definecolor{green-2}{HTML}{518b45} % #518b45

\RequirePackage{graphicx}

% \RequirePackage{tikz}
% \usetikzlibrary{fadings}
%
% \tikzfading[
%   name=fade right,
%   left color=transparent!0,
%   right color=transparent!100,
% ]
%
% \newcommand\faderule[3][accent]{%
%   \noindent%
%   \begin{tikzpicture}
%     \fill[#1, path fading=fade right, fading angle=0]
%       (0,0) rectangle (#2,#3);
%
%
%
%   \end{tikzpicture}
% }

\AtEndPreamble{
  \pagenumbering{arabic} 
  % has to be issued before loading hyperref, as to set \thepage and hence to avoid hyperref issuing a warning and setting pdfpagelabels=false

  \PassOptionsToPackage{unicode}{hyperref}

  \RequirePackage{hyperref}
  \hypersetup{
    colorlinks  = false,
    linkcolor   = link,
    anchorcolor = link,
    urlcolor    = link,
    citecolor   = link,
    % Metadata
    pdfinfo = {
      Title   =\@title,
      Author  =\@author,
      Creator =\@creator,
      Subject =\@subject,
      Keywords=\@keywords,
    },
    pdfpagelayout      = {OneColumn},
    pdfstartview       = {FitH},
    pdfremotestartview = {FitH}
    pdfdisplaydoctitle = true,
    pdfstartpage={1},
  }
}

% % minimal base settings
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength{\parindent}{0\p@}
\setlength{\parskip}{0\p@}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

% \setlength{\pdfpageheight}{\paperheight}
% \setlength{\pdfpagewidth}{\paperwidth}
% \setlength{\textheight}{.95\paperheight}
% \setlength{\textwidth}{.95\paperwidth}
% \setlength\hoffset{-10pt}
% \setlength\voffset{0pt}
% \setlength{\topmargin}{.1\paperheight}
% \setlength{\headheight}{0pt}
% \setlength{\headsep}{0pt}
% \setlength{\footskip}{0pt}
% \setlength{\parindent}{0pt}
% \setlength{\parskip}{5pt}

\RequirePackage{geometry}
\geometry{
  a4paper,  % {210mm, 297mm}, % (√2:1 ) A4
  top       = .02\paperheight, % 21mm
  bottom    = .02\paperheight, % 21mm
  left      = .04\paperwidth,
  right     = .04\paperwidth,
  portrait  = true,
}

\pagestyle{empty}

\raggedbottom
\onecolumn

\RequirePackage[fontsize=11pt]{fontsize}
\RequirePackage{fontspec}
\defaultfontfeatures{
  Numbers={Monospaced,Lining}
}
\setmainfont{SourceSerif4}[extension=.otf]
\setsansfont{SourceSans3}[extension={.otf}]
\setmonofont{SauceCodeProNerdFont}[extension={.otf}]

\renewcommand\familydefault{\sfdefault}

% title
\renewcommand*{\title}[1]{\gdef\@title{#1}}
\renewcommand*{\@title}{\@author}

% author
\renewcommand*{\author}[2]{%
  \gdef\@firstname{#1}
  \gdef\@lastname{#2}
  \gdef\@author{#1~#2}%
}
\newcommand\@firstname{}
\newcommand\@lastname{}

% Subject
\newcommand*{\subject}[1]{\gdef\@subject{#1}}
\newcommand*{\@subject}{R\'{e}sum\'{e} of \@author}

% keywords
\newcommand*{\keywords}[1]{\gdef\@keywords{#1}}
\newcommand*{\@keywords}{\@author, curriculum vit\ae{}, r\'{e}sum\'{e}}

% creator
\newcommand*{\creator}[1]{\gdef\@creator{#1}}
\newcommand*{\@creator}{\@author}

% email
\newcommand*{\email}[1]{\gdef\@email{#1}}
\newcommand*{\@email}{}

% quote
\newcommand*{\quote}[1]{\gdef\@quote{#1}}
\newcommand*{\@quote}{}

\RequirePackage{setspace}

\newcommand\insertauthor{{\HUGE\textcolor{accent-2!50!grey-2!65}{\@firstname}~\textcolor{accent-2}{\@lastname}}}
\newcommand\insertquote{{%
  \scriptsize\color{accent-2!90}\itshape%
  \@quote%
}}

\PassOptionsToPackage{fixed}{fontawesome6}
\RequirePackage{fontawesome6}

\newcommand\insertsocialrow[4]{\href{#1}{#2~#3~#4} \\}

\newcommand\insertsocialemail[1]{\insertsocialrow{mailto:#1}{\faEnvelope}{email:}{#1}}
\newcommand\insertlinkedin[1]{\insertsocialrow{https://www.linkedin.com/in/#1}{\faLinkedin}{Linkedin:}{#1}}
\newcommand\insertgithub[1]{\insertsocialrow{https://github.com/#1}{\faGithub}{GitHub:}{#1}}
\newcommand\insertgitlab[1]{\insertsocialrow{https://gitlab.com/#1}{\faGitlab}{GitLab:}{#1}}
\newcommand\inserttexstackexchange[2]{\insertsocialrow{https://tex.stackexchange.com/users/#1/#2}{\faStackExchange}{\TeX~SE:}{#1-#2}}
\newcommand\insertorcid[1]{\insertsocialrow{https://orcid.org/#1}{\faOrcid}{Orcid:}{#1}}
\newcommand\insertwhatsapp[2]{\insertsocialrow{https://wa.me/#1}{\faWhatsapp}{WhatsApp:}{#2}}
\newcommand\insertmatrix[1]{\insertsocialrow{matrix.to/#1}{\faComments}{Matrix:}{#1}}

\newcommand\maketitle{%
  \noindent
  \begin{minipage}[b]{.7125\textwidth} % .95*3/4 = 0.7125
    \insertauthor
  \end{minipage}%
  \hfill%
  \begin{minipage}[b]{.2375\textwidth} % .95/4 = .2375
    \insertquote
  \end{minipage}\\[-0.9ex]
  \noindent
  {\color{accent}\rule{\linewidth}{1pt}}
  \par\nopagebreak
  % \faderule{\linewidth}{1pt}
  \vspace{3pt}
}

\newcommand\section[1]{
  {
    \vspace{6pt}
    \color{accent}
    \noindent
    {\Large#1}\\[-1.7ex]
    \rule{\linewidth}{0.4pt}
    \par\nopagebreak
  }
  % \vspace{0pt}
}

\NewDocumentCommand\cventry{m m m o}{
  \noindent
  \begin{minipage}[t]{.15\textwidth}
    \color{accent-2}
    #1
  \end{minipage}%
  \hspace{3pt}%
  \begin{minipage}[t]{.75\textwidth}
    #2\\[-2pt]
    {\footnotesize #3}
  \end{minipage}%
  \IfNoValueF{#4}{
    \hfill
    \begin{minipage}{4em}
      \hfill
      #4
    \end{minipage}
  }
  \vspace{6pt}\par
}

\NewDocumentCommand\cvitem{s o m o}{
  \IfBooleanTF{#1}{%
    \noindent%
  }{%
    \vspace{-3pt}%
    \noindent%
    \hspace{.15\textwidth}\hspace{3pt}%
  }%
  {\color{accent-2}
    \IfNoValueTF{#2}
    {\faCaretRight}
    % {\faChevronRight}
    {#2}
  }
  \hspace{3pt}%
  \begin{minipage}[t]{.8\textwidth}
    #3%
  \end{minipage}%
  \IfNoValueF{#4}{%
    \hfill
    \begin{minipage}{6em}
      \hfill
      \raggedleft
      #4%
    \end{minipage}%
  }
  \par
  \vspace{3pt}
}

\AtBeginDocument{%
  \normalfont\color{foreground}%
  \maketitle
}
