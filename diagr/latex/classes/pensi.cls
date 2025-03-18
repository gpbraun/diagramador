%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   pensi.cls
%
%   Gabriel Braun, 2025
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { expl3 }

\ExplSyntaxOn

\ProvidesExplClass
	{ pensi }
	{ \c_diagr_pkg_date_tl }
	{ \c_diagr_version_tl  }
	{ \c_diagr_info_tl     }

\LoadClass { base }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÕES GERAIS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\examoptions
  { 
    DIV = 18,
    fontsize = 10pt,
		headinclude = true,
		footinclude = true,
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   FONTES ADICIONAIS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fonte do título
\newfontfamily\headingfamily{FiraSans}[
  Extension = .ttf,
  UprightFont    = *-Regular,
  BoldFont       = *-Bold,
  ItalicFont     = *-Italic,
  BoldItalicFont = *-BoldItalic,
]

\setkomafont { disposition } { \bfseries\headingfamily }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CABEÇALHOS DE SEÇÕES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_set:Npn \SectionHeader
  #1 % -> título 
  {
    \draw_begin:
    \draw_linewidth:V \g_braun_linewidth_dim
    \hcoffin_set:Nn   \l_tmpa_coffin { \text_uppercase:n {#1} }
		\draw_path_rectangle:nn
      { 0cm , 0cm }
      { \linewidth , 3 \coffin_ht:N \l_tmpa_coffin}
		\color_fill:n { black!10 }
		\draw_path_use_clear:n { stroke, fill }
		\draw_transform_shift:n 
			{ 0.5 \linewidth , 1.5 \coffin_ht:N \l_tmpa_coffin }
		\draw_coffin_use:Nnn \l_tmpa_coffin {hc} {vc}
		\draw_path_lineto:n 
			{ \linewidth, 0cm }
    \draw_end:
  }

\cs_set:Npn \ProblemHeader
  #1 % -> pontuação do problema
  {
    \minisec
      {
        \draw_begin:
        \draw_linewidth:V \g_braun_linewidth_dim
        \hcoffin_set:Nn   \l_tmpa_coffin 
          {
            Questão~ \arabic{problem}
          }
        \draw_path_rectangle:nn 
          { 0cm , 0cm }
          { \linewidth, \coffin_ht:N \l_tmpa_coffin + 1em }
        \color_fill:n { black!10 }
        \draw_path_use_clear:n { fill }
        % bottom line
        \draw_path_moveto:n 
          { 0cm, 0cm }
        \draw_path_lineto:n 
          { \linewidth, 0cm }
        \draw_path_use_clear:n { stroke }
        % text
        \draw_transform_shift:n 
          { 0.5em , 0.5em }
        \draw_coffin_use:Nnn \l_tmpa_coffin {l} {H}
        \draw_end:
      }
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   TÍTULO
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setkomafont { title        } { \usekomafont { disposition } \LARGE   }
\setkomafont { publishers   } { \usekomafont { disposition } \large   }
\setkomafont { pageheadfoot } { \usekomafont { disposition } \itshape }

\cs_set:Npn \maketitle
  {
		\group_begin:
		\dim_gzero:N \@topnum % Prevents figures from going at top of page.
    \begin{tikzpicture}[overlay, remember~picture]
      \node (header) [ anchor = north~ west, inner~ sep = 0pt ] 
        at (current~page.north~west)
        {
          \includegraphics 
            [ width = \paperwidth ] 
            { pensi-header-title.pdf }	
        };
      \node (titlebox)
        [
          anchor = east, 
          shift = {(-1, 0)}, 
          align=right,
          fill = yellow,
          inner~ xsep = 2em,
          inner~ ysep = 1em,
          rounded~ rectangle,
          rounded~ rectangle~ right~ arc = none,
        ] 
        at (header.east)
        {
          \group_begin:
            \usekomafont { title }
            \l_braun_title_tl
          \group_end:
          \\[1ex]
          \group_begin:
            \usekomafont { publishers }
            \l_braun_affiliation_tl\;
            \l_braun_date_tl
          \group_end:
        };
      \fill [yellow] 
        ($(titlebox.north~ east) + ( 5pt, 0)$) rectangle 
        ($(titlebox.south~ east) + (10pt, 0)$);
      \fill [yellow] 
        ($(titlebox.north~ east) + (15pt, 0)$) rectangle 
        ($(titlebox.south~ east) + (1cm, 0)$);
    \end{tikzpicture}
    \skip_vertical:n { 3\bigskipamount }
    \cs_undefine:N \maketitle
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÕES DE PÁGINA
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chead 
  {
    \begin{tikzpicture} [ remember~ picture, overlay ]
      \node (header) [ anchor = north~ west, inner~ sep = 0pt ] 
        at ( current~ page.north~ west )
        {
          \includegraphics
            [ width = \paperwidth ]
            { pensi-header.pdf }
        };
      \node 
        [ 
          anchor = north~ east, 
          align = right,
          fill = yellow,
          inner~ xsep = 1em,
          minimum~ size = 8.6mm,
          rounded~ rectangle,
          rounded~ rectangle~ right~ arc = none,
          
        ] 
        at ( header.north~ east )
        {
          \l_braun_title_tl
        };
    \end{tikzpicture}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   AMBIENTE DE SOLUÇÃO
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tcbuselibrary { skins, breakable }

\tcbset { enhanced~ jigsaw }

\newcounter { step } [ problem ]

\cs_set:Npn \SolutionStepHeader #1
  {
    \refstepcounter { step }

    \tcbsubtitle
      [
        enhanced,
        top = 0.5ex,
        bottom = 0.5ex,
        frame~ hidden,
		    colback = yellow!15,
      ]
      {
        \sffamily  
        {
          \strut 
          \usekomafont { disposition }
          Etapa~ \arabic{ step }. 
        }
        \; #1
      }
  }

\NewDocumentEnvironment { solution } { o }
    {
      \begin{tcolorbox}
        [
          breakable,
          title = 
            {
              \usekomafont{disposition}
              \IfValueTF {#1} {#1} { Gabarito }
            },
          coltitle = black,
          colback = white,
          boxrule = \g_braun_linewidth_dim,
          attach~ boxed~ title~ to~ top~ center =
            {
              yshift = -3mm,
              yshifttext = -1mm,
            },
          boxed~ title~ style~ =
            {
              size = small,
              colback = white,
              boxrule = \g_braun_linewidth_dim,
            }
        ]	
      \dim_set_eq:NN \parskip \bigskipamount
      \cs_set:Npn \toprule    {\\[-1.5em]}
      \cs_set:Npn \bottomrule {\\[-2.5em]}
      \smallskip
      \small
    } 
    {
      \end{tcolorbox}
    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   THE END!!!
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOff
