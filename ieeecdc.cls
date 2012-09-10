\ProvidesClass{ieeecdc}
\NeedsTeXFormat{LaTeX2e}

\newif\if@working \@workingfalse
\newif\if@ieeetran \@ieeetranfalse
\newif\if@amsthm \@amsthmfalse

\DeclareOption{working}{\@workingtrue}
\DeclareOption{ieeetran}{\@ieeetrantrue}
\DeclareOption{amsthm}{\@amsthmtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ieeeconf}}

\ProcessOptions

\if@ieeetran

  \if@working
    \LoadClass[onecolumn, twoside, draft, 12pt]{IEEEtran}
  \else
    % Setting the proper margins
    \newcommand{\CLASSINPUTtoptextmargin}{54pt}
    \newcommand{\CLASSINPUTbottomtextmargin}{54pt}
    \newcommand{\CLASSINPUTinnersidemargin}{54pt}
    \newcommand{\CLASSINPUToutersidemargin}{54pt}
    \LoadClass[letterpaper, 10pt, conference]{IEEEtran}
  \fi

  \if@amsthm
    \RequirePackage{amsthm}
    \renewcommand{\qedsymbol}{\(\blacksquare\)}
  \fi

  % Making the title bold
  \def\@maketitle{\newpage
  \begin{center}
    \vskip0.25in{\bfseries\LARGE\@title\par}\vskip1.0em\par
    {\@IEEEspecialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace
      \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
  \end{center}}

\else

  \if@working
    \LoadClass[onecolumn, twoside, draft, 12pt]{ieeeconf}
  \else
    \LoadClass[letterpaper, 10pt, conference]{ieeeconf}
  \fi

  \def\endfigure{\end@float}
  \def\endtable{\end@float}

  % Integrating amsthm properly by redefining proof
  \if@amsthm
    \makeatletter
    \let\IEEEproof\proof
    \let\IEEEendproof\endproof
    \let\proof\@undefined
    \let\endproof\@undefined
    \makeatother
    \RequirePackage{amsthm}
    \renewcommand{\qedsymbol}{\(\blacksquare\)}
  \fi

  % Making the title bold
  \def\@maketitle{\newpage
  \begin{center}
    \vskip0.25in{\bfseries\LARGE\@title\par}\vskip1.0em\par
    {\@specialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace
      \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
  \end{center}}

\fi

% Making sure the \thanks command is available
\IEEEoverridecommandlockouts

\endinput
