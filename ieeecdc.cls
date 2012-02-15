\ProvidesClass{ieeecdc}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
\ProcessOptions\relax

\newcommand{\CLASSINPUTtoptextmargin}{72pt}
\newcommand{\CLASSINPUTbottomtextmargin}{54pt}
\newcommand{\CLASSINPUTinnersidemargin}{54pt}
\newcommand{\CLASSINPUToutersidemargin}{54pt}

\LoadClass[letterpaper, 10pt, conference]{IEEEtran}

\IEEEoverridecommandlockouts

\endinput
