\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fp-cv}[2025-07-16 Felipe Pinto's Curriculum Vitae Class]

% process given options
\ProcessOptions\relax

\RequirePackage{luacode}

%% Apply size
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{xparse}
\RequirePackage{adjustbox}

\RequirePackage{ifthen}

%% INFO: colors
\RequirePackage{xcolor}

\providecolor{foreground}{named}{black}
\providecolor{background}{named}{white}
\providecolor{grey}{HTML}{777777}
\providecolor{link}{named}{red}

\providecolor{accent}{named}{blue}
\providecolor{accent-secondary}{named}{cyan}

\colorlet{accent-faded}{accent!80}

\newcommand\setaccent[2][90]{
  \colorlet{accent}{#2}%
  \colorlet{accent-faded}{accent!#1}%
}

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

\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}

\RequirePackage{geometry}
\geometry{
  a4paper, % {210mm, 297mm}, % (√2:1 ) A4
  top      = .02\paperheight, % 21mm
  bottom   = .02\paperheight, % 21mm
  left     = .04\paperwidth,
  right    = .04\paperwidth,
  portrait = true,
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

% socials
\newcommand*{\socials}[1]{\gdef\@socials{#1}}
\newcommand*{\@socials}{}

% title element on right
\newcommand*{\titleelement}[1]{\gdef\@titleelement{#1}}
\newcommand*{\@titleelement}{}

\RequirePackage{setspace}

\newcommand\insertauthor{{\HUGE\textcolor{accent!50!grey!65}{\@firstname}~\textcolor{accent}{\@lastname}}}

\newcommand\quote[1]{%
  \begin{adjustbox}{valign=b, minipage=.5\textwidth}
    \setlength\baselineskip{-0.1ex}
    \raggedleft
    \scriptsize\color{accent-faded}\itshape%
    #1%
  \end{adjustbox}
}

\PassOptionsToPackage{fixed}{fontawesome6}
\RequirePackage{fontawesome6}

\newcommand\insertsocialrow[4]{\href{#1}{{\color{accent-secondary}#2}~#3~#4} \\}

\newcommand\insertsocialemail[1]{\insertsocialrow{mailto:#1}{\faEnvelope}{Email:}{#1}}
\newcommand\insertlinkedin[1]{\insertsocialrow{https://www.linkedin.com/in/#1}{\faLinkedin}{Linkedin:}{#1}}
\newcommand\insertgithub[1]{\insertsocialrow{https://github.com/#1}{\faGithub}{GitHub:}{#1}}
\newcommand\insertgitlab[1]{\insertsocialrow{https://gitlab.com/#1}{\faGitlab}{GitLab:}{#1}}
\newcommand\inserttexstackexchange[2]{\insertsocialrow{https://tex.stackexchange.com/users/#1/#2}{\faStackExchange}{\TeX~SE:}{#1-#2}}
\newcommand\insertorcid[1]{\insertsocialrow{https://orcid.org/#1}{\faOrcid}{Orcid:}{#1}}
\newcommand\insertwhatsapp[2]{\insertsocialrow{https://wa.me/#1}{\faWhatsapp}{WhatsApp:}{#2}}
\newcommand\insertmatrix[1]{\insertsocialrow{matrix.to/#1}{\faComments}{Matrix:}{#1}}

\providecommand\quotewidth{10em}
\providecommand\logoheight{2ex}

\newcommand\maketitle{%
  \noindent%
  \insertauthor%
  \hfill%
  \smash{\@titleelement}%
  \\[-.9ex]%
  \noindent%
  {\color{accent}\rule{\linewidth}{1pt}}%
  \par\nopagebreak
  % \faderule{\linewidth}{1pt}
  \vspace{-13pt}
}

\newlength\secspacebf
\setlength\secspacebf{6pt}

\newcommand\section[1]{
  \vspace{\secspacebf}
  \noindent
  {%
    \color{accent}%
    \Large#1%
    \\[-1.2ex]
    \rule{\linewidth}{0.4pt}%
  }%
  \par\nopagebreak
  % \vspace{1pt}
}

\newcommand\subsection[2][]{
    \par\noindent
    {\color{accent}#2}%
    \hfill#1\\[-1.7ex]
    \par\nopagebreak
}

\newlength\entrysep
\setlength\entrysep{\dimeval{16.5pt+3pt}}
% \setlength\entrysep{\dimeval{1.0em+5pt}}

\NewDocumentCommand\cventry{
  m % #1 year-year
  m % #2 title
  o % #3 subtitle
  o % #4 image
}{
  \begingroup
  \setlength{\parindent}{-\entrysep}
  \setlength{\leftskip}{\entrysep}
  \par\addvspace{.3\secspacebf}
  \makebox[\entrysep][l]{\smash{\raggedleft\color{accent}\adjustbox{rotate=90, origin=rt, raise={.4ex}{1ex}{0pt}}{#1}}}%
  #2%
  \IfValueT{#3}{
    \IfValueT{#4}{
      \hfill\smash{\adjustbox{valign=t}{#4}}
    }
    \par
    \noindent{\scriptsize #3\par}%
  }
  \addvspace{.15\secspacebf}
  \nopagebreak
  \endgroup
}

\NewDocumentCommand\cvitem{
  s % 1 dont align with entry
  O{\faCaretRight} % 2 symbol
  +m % 3 content
}{
  \nopagebreak%
  \begingroup
  \setlength{\parindent}{-\entrysep}
  \IfBooleanTF{#1}{
    \setlength{\leftskip}{\entrysep}
  }{
    \setlength{\leftskip}{2\entrysep}
  }
  \makebox[\entrysep]{%
    \smash{\color{accent-secondary}#2}%
  }%
  \ignorespaces#3\par%
  \addvspace{3pt}%
  \endgroup
}

\AtBeginDocument{%
  \normalfont\color{foreground}%
  \maketitle
}
