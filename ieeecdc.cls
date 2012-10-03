\ProvidesClass{ieeecdc}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ieeeconf}}
\ProcessOptions
\LoadClass[letterpaper, 10pt, conference]{ieeeconf}

% Allows packages to act on floats correctly
\def\endfigure{\end@float}
\def\endtable{\end@float}

% Makes the title bold
\def\@maketitle{\newpage
\begin{center}
  \vskip0.25in{\bfseries\LARGE\@title\par}\vskip1.0em\par
  {\@specialpapernotice\mbox{}\vskip\@IEEEauthorblockconfadjspace
    \mbox{}\hfill\begin{@IEEEauthorhalign}\@author\end{@IEEEauthorhalign}\hfill\mbox{}\par}\relax
\end{center}}

% Enables the \thanks command
\IEEEoverridecommandlockouts

\endinput
