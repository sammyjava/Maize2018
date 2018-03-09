%$Id: a0poster.cls,v 1.5 1999/04/05 14:49:56 mjf Exp $
%/
%% This is file `a0poster.cls'
%% 
%% Copyright (C) 07.05.97 Gerlinde Kettl and Matthias Weiser
%%
%% Problems, bugs and comments to 
%% gerlinde.kettl@physik.uni-regensburg.de
%% 
%% changed textwidths and margins to cope with printable area and
%% frame.  Make sure that the offsets are set to -1in!
%% Also changed scaling for a0->a4, since this was wrong.

%% This version changed by Hugh Pumphrey on 4.5.1999. Every instance
%% of the string ``draft'' replaced by the string ``preview''. This gives 
%% an a4 size preview but includes the postscript figures

\ProvidesClass{a0poster}[1997/05/07 v1.21b a0poster class (GK, MW)]
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\LoadClass{article}

\newif\ifportrait
\newif\ifanullb
\newif\ifanull
\newif\ifaeins
\newif\ifazwei
\newif\ifadrei
\newif\ifpreview
\newif\iffourbyfour
\newif\ifaspb
\newif\ifmaize

\newcount\xkoord
\newcount\ykoord
\newcount\xscale
\newcount\yscale

%% SAM ADDED
\DeclareOption{aspb}{
  \aspbtrue\anullbfalse
  \xkoord=3096 % big points (1 bp=1/72 inch)
  \ykoord=3024 % big points (1 bp=1/72 inch)
  \xscale=27
  \yscale=27
}

%% SAM ADDED
\DeclareOption{fourbyfour}{
  \fourbyfourtrue\anullbfalse
  \xkoord=3456 % big points (1 bp=1/72 inch)
  \ykoord=3456 % big points (1 bp=1/72 inch)
  \xscale=27
  \yscale=27
}

\DeclareOption{a0b}{
  \anullbtrue
  \xkoord=2592 % big points (1 bp=1/72 inch)
  \ykoord=3666 % big points (1 bp=1/72 inch)
  \xscale=23
  \yscale=23
}

%% SAM TWEAKED
\DeclareOption{a0}{
  \anulltrue\anullbfalse
  \xkoord=2384 % big points (1 bp=1/72 inch) was 2380
  \ykoord=3370 % big points (1 bp=1/72 inch) was 3368
  \xscale=25
  \yscale=25
}

\DeclareOption{a1}{
  \aeinstrue\anullbfalse
  \xkoord=1684 % big points (1 bp=1/72 inch)
  \ykoord=2380 % big points (1 bp=1/72 inch)
  \xscale=3
  \yscale=3
}
\DeclareOption{a2}{
  \azweitrue\anullbfalse
  \xkoord=1190 % big points (1 bp=1/72 inch)
  \ykoord=1684 % big points (1 bp=1/72 inch)
  \xscale=4
  \yscale=4
}
\DeclareOption{a3}{
  \adreitrue\anullbfalse
  \xkoord=842  % big points (1 bp=1/72 inch)
  \ykoord=1190 % big points (1 bp=1/72 inch)
  \xscale=6
  \yscale=6
}
\DeclareOption{landscape}{
  \portraitfalse
}
\DeclareOption{portrait}{
  \portraittrue
}
\DeclareOption{preview}{
  \previewtrue
}
\DeclareOption{final}{
  \previewfalse
}
\DeclareOption*{\PackageWarning{a0poster}{Unknown Option \CurrentOption}}
\ExecuteOptions{landscape,a0b,final}
\ProcessOptions\relax

\ifanullb
\setlength{\paperwidth}{129.3cm} %% 36 * sqrt(2) in
\setlength{\paperheight}{91.4cm} %% 36 in
\setlength{\textwidth}{119.3cm} %% paperwidth - (5cm + 5cm)
\setlength{\textheight}{81.4cm} %% paperheight - (5cm + 5cm)
\else\iffourbyfour
\setlength{\paperwidth}{48in}    %% 4 feet
\setlength{\paperheight}{48in}   %% 4 feet
\setlength{\textwidth}{46in}     %% paperwidth - (0.5in + 0.5in)
\setlength{\textheight}{46in}    %% paperheight - (0.5in + 0.5in)
\else\ifaspb
\setlength{\paperwidth}{43in}    %% 3'7''
\setlength{\paperheight}{42in}   %% 3'6''
\setlength{\textwidth}{41in}     %% paperwidth - (0.5in + 0.5in)
\setlength{\textheight}{40in}    %% paperheight - (0.5in + 0.5in)
\else\ifmaize
\setlength{\paperwidth}{33in}    %% 
\setlength{\paperheight}{46in}   %% 
\setlength{\textwidth}{44in}     %% paperwidth - (0.5in + 0.5in)
\setlength{\textheight}{31in}    %% paperheight - (0.5in + 0.5in)
\else\ifanull
\setlength{\paperwidth}{118.82cm} %% A0 landscape
\setlength{\paperheight}{83.96cm}
\setlength{\textwidth}{112.82cm} %% paperwidth - (3cm + 3cm)    %% \setlength{\textwidth}{108.82cm} %% paperwidth - (5cm + 5cm)
\setlength{\textheight}{77.96cm} %% paperheight - (3cm + 3cm)   %% \setlength{\textheight}{73.96cm} %% paperheight - (5cm + 5cm)
\else\ifaeins
\setlength{\paperwidth}{83.96cm}
\setlength{\paperheight}{59.4cm}
\setlength{\textwidth}{79.96cm}
\setlength{\textheight}{55.4cm}
\else\ifazwei
\setlength{\paperwidth}{59.4cm}
\setlength{\paperheight}{41.98cm}
\setlength{\textwidth}{55.4cm}
\setlength{\textheight}{37.98cm}
\else\ifadrei
\setlength{\paperwidth}{41.98cm}
\setlength{\paperheight}{29.7cm}
\setlength{\textwidth}{37.98cm}
\setlength{\textheight}{25.7cm}
\else\relax
\fi
\fi
\fi
\fi
\fi
\fi

\ifportrait
\newdimen\tausch
\setlength{\tausch}{\paperwidth}
\setlength{\paperwidth}{\paperheight}
\setlength{\paperheight}{\tausch}
\setlength{\tausch}{\textwidth}
\setlength{\textwidth}{\textheight}
\setlength{\textheight}{\tausch}
\else\relax
\fi

%% Setting proper dimensions for the HP2500CP printer (height = 36 in)
%%   Landscape: unprintable areas
%%   	L: 27.6mm
%%   	R: 27.1mm
%%   	T: 18.4mm
%%   	B: 18.1mm


\voffset -1in
\hoffset -1in

\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\topmargin}{1in}     %% 3 cm for unprintable at top WAS 5
%% (landscape) + 2 cm from border
\setlength{\oddsidemargin}{1in} %% 3 cm for unprintable at left WAS 5
%% (landscape) + 2 cm from border
\setlength{\topskip}{0in}

\input{a0size.sty}

\renewcommand{\tiny}{\fontsize{12}{14}\selectfont}
\renewcommand{\scriptsize}{\fontsize{14}{18}\selectfont}   
\renewcommand{\footnotesize}{\fontsize{18}{22}\selectfont}
\renewcommand{\small}{\fontsize{24.88}{30}\selectfont}
\renewcommand{\normalsize}{\fontsize{30}{36}\selectfont} % was 24 30
\renewcommand{\large}{\fontsize{32}{38}\selectfont}
\renewcommand{\Large}{\fontsize{38}{45}\selectfont}
\renewcommand{\LARGE}{\fontsize{44}{54}\selectfont}
\renewcommand{\huge}{\fontsize{52}{64}\selectfont}
\renewcommand{\Huge}{\fontsize{62}{77}\selectfont}
\newcommand{\veryHuge}{\fontsize{74}{93}\selectfont}
\newcommand{\VeryHuge}{\fontsize{84}{100}\selectfont}
\newcommand{\VERYHuge}{\fontsize{107}{134}\selectfont}

\setlength\smallskipamount{6pt plus 2pt minus 2pt}
\setlength\medskipamount{12pt plus 4pt minus 4pt}
\setlength\bigskipamount{24pt plus 8pt minus 8pt}

\setlength\abovecaptionskip{25pt}
\setlength\belowcaptionskip{0pt}
\setlength\abovedisplayskip{25pt plus 6pt minus 15pt}
\setlength\abovedisplayshortskip{0pt plus 6pt}
\setlength\belowdisplayshortskip{13pt plus 7pt minus 6pt}
\setlength\belowdisplayskip\abovedisplayskip

\normalsize

\AtBeginDocument{
  \ifanullb
  \ifportrait\special{papersize=91.4cm,129.3cm}\else\special{papersize=129.3cm,91.4cm}\fi
  \else\iffourbyfour
  \ifportrait\special{papersize=48in,48in}\else\special{papersize=48in,48in}\fi
  \else\ifaspb
  \ifportrait\special{papersize=42in,43in}\else\special{papersize=43in,42in}\fi
  \else\ifmaize
  \ifportrait\special{papersize=33in,46in}\else\special{papersize=46in,33in}\fi
  \else\ifanull
  \ifportrait\special{papersize=83.96cm,118.82cm}\else\special{papersize=118.82cm,83.96cm}\fi
  \else\ifaeins
  \ifportrait\special{papersize=59.4cm,83.96cm}\else\special{papersize=83.96cm,59.4cm}\fi
  \else\ifazwei
  \ifportrait\special{papersize=41.98cm,59.4cm}\else\special{papersize=59.4cm,41.98cm}\fi
  \else\ifadrei
  \ifpreview
  \ifportrait\special{papersize=29.7cm,41.35cm}\else\special{papersize=41.98cm,29.0cm}\fi
  \else
  \ifportrait\special{papersize=29.7cm,41.98cm}\else\special{papersize=41.98cm,29.7cm}\fi
  \fi
  \else\relax
  \fi
  \fi
  \fi
  \fi
  \fi
  \fi
  \pagestyle{empty}}

\endinput
%% 
%% End of file `a0poster.cls'.
