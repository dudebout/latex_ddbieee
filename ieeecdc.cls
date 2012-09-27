\ProvidesClass{ieeecdc}
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{xspace}

\newif\if@working \@workingfalse
\newif\if@ieeetran \@ieeetranfalse
\newif\if@amsthm \@amsthmfalse
\newif\if@nicetitle \@nicetitlefalse

\DeclareOption{working}{\@workingtrue}
\DeclareOption{ieeetran}{\@ieeetrantrue}
\DeclareOption{amsthm}{\@amsthmtrue}
\DeclareOption{nicetitle}{\@nicetitletrue}

\if@ieeetran
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
  \ProcessOptions

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

  \if@nicetitle
  \renewcommand{\and}{and\xspace}
  \else
  % Making the title bold
  \def\@maketitle{\newpage
    \begin{center}
      \vskip0.25in{\bfseries\LARGE\@title\par}\vskip1.0em\par
      {\@IEEEspecialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace
        \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
    \end{center}}
    \fi
\else
  \DeclareOption*{\PassOptionsToClass{\CurrentOption}{ieeeconf}}
  \ProcessOptions

  \if@working
    \LoadClass[onecolumn, twoside, draft, 12pt]{ieeeconf}
  \else
    \LoadClass[letterpaper, 10pt, conference]{ieeeconf}
  \fi

  \def\endfigure{\end@float}
  \def\endtable{\end@float}

  % Integrating amsthm properly by redefining proof
  \if@amsthm
    \let\IEEEproof\proof
    \let\IEEEendproof\endproof
    \let\proof\@undefined
    \let\endproof\@undefined
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
