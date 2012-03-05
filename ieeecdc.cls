\ProvidesClass{ieeecdc}
\NeedsTeXFormat{LaTeX2e}

\newif\ifCLASSOPTIONdraft \CLASSOPTIONdraftfalse
\DeclareOption{draft}{\CLASSOPTIONdrafttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}

\ProcessOptions

\ifCLASSOPTIONdraft
  \LoadClass[onecolumn, draft, 12pt]{IEEEtran}
\else
  \newcommand{\CLASSINPUTtoptextmargin}{54pt}
  \newcommand{\CLASSINPUTbottomtextmargin}{54pt}
  \newcommand{\CLASSINPUTinnersidemargin}{54pt}
  \newcommand{\CLASSINPUToutersidemargin}{54pt}
  \LoadClass[letterpaper, 10pt, conference]{IEEEtran}
\fi

\def\@maketitle{\newpage
\begin{center}%
   \vskip0.25in{\bfseries\LARGE\@title\par}\vskip1.0em\par%
   {\@IEEEspecialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace%
     \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
\end{center}}


\IEEEoverridecommandlockouts

\endinput
