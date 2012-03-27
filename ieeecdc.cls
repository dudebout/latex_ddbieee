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
    \newcommand{\CLASSINPUTtoptextmargin}{54pt}
    \newcommand{\CLASSINPUTbottomtextmargin}{54pt}
    \newcommand{\CLASSINPUTinnersidemargin}{54pt}
    \newcommand{\CLASSINPUToutersidemargin}{54pt}
    \LoadClass[letterpaper, 10pt, conference]{IEEEtran}
  \fi

  \def\@maketitle{\newpage
  \begin{center}
    \vskip0.25in{\bfseries\LARGE\@title\par}\vskip1.0em\par
    {\@IEEEspecialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace
      \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
  \end{center}}

  \if@amsthm
    \RequirePackage{amsthm}
  \fi
\else
  \if@working
    \LoadClass[onecolumn, twoside, draft, 12pt]{ieeeconf}
  \else
    \LoadClass[letterpaper, 10pt, conference]{ieeeconf}
  \fi

  \if@amsthm
    \makeatletter
    \let\IEEEproof\proof
    \let\IEEEendproof\endproof
    \let\proof\@undefined
    \let\endproof\@undefined
    \makeatother
    \RequirePackage{amsthm}
  \fi

  \def\@maketitle{\newpage
  \begin{center}%
  \if@technote%
     {\bfseries\large\@title\par}\vskip 1.3em{\lineskip .5em\@author\@specialpapernotice\par}%
  \else% not a technote
     \vskip0.25in{\LARGE\@title\par}\vskip1.0em\par%
     % V1.6 handle \author differently if in conference mode
     \if@confmode%
        {\@specialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace%
        \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}%
     \else% peerreviewca, peerreview or journal
        \if@peerreviewcaoption
           % peerreviewca handles author names just like conference mode
           {\@specialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace%
           \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}%
        \else % journal or peerreview
           {\lineskip.5em\sublargesize\@author\@specialpapernotice\par}%
        \fi
     \fi
  \fi\end{center}}

\fi

\IEEEoverridecommandlockouts

\endinput
