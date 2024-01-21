%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Gabriel Braun, 2024
%
%   ita.cls
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { xparse }

\ExplSyntaxOn

\ProvidesExplClass
	{ mil  }
	{ 2024 }
	{ 3.0  }
	{ Avaliação modelo MIL }

\LoadClass { exam }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÕES GERAIS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { cmbright }
\RequirePackage [  scaled  ]  { helvet }

\cs_set_eq:NN \familydefault \sfdefault

\mhchemoptions
  {
      textfontcommand = \sffamily,
      mathfontcommand = \mathsf
  }

\KOMAoptions 
  { 
    DIV = 25, 
    fontsize = 9pt,
    twocolumn = true,
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CABEÇALHOS DE SEÇÕES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_set:Npn \examrule
  % linha horizontal
  {
    \noindent \skip_horizontal:n { -\marginparsep }
    \exp_args:NnV \rule { \linewidth + 2 \marginparsep } \g_braun_linewidth_dim
  }

\cs_set:Npn \SectionHeader
  #1 % -> título 
  {
    \begin{center}
      \text_uppercase:n {#1} \\
      \examrule
    \end{center}
  }

\cs_set:Npn \ProblemHeader
  #1 % -> pontuação do problema
  {
    \paragraph
      {
        \arabic{problem}.
      }
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÃO DA PÁGINA
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\dim_set:Nn \columnsep { 2\marginparsep }

\cs_set:Nn \braun_twocolumn_page_box:n
  % #1 -> deslocamento vertical da linha do meio.
  {
    \vbox_to_zero:n % zero height
      {
        \hbox_to_zero:n % zero width
          {
            \draw_begin:
            \draw_linewidth:V \g_braun_linewidth_dim
            \skip_horizontal:n 
              { - \linewidth / 2 - \marginparsep }
            \draw_path_rectangle:nn 
              { 0cm , 0cm }
              { \linewidth + 2 \marginparsep , \textheight + \footskip - 1.5ex }
            % LINHA NO MEIO
            \draw_path_moveto:n 
              { \linewidth/2 + \marginparsep , 0cm }
            \draw_path_lineto:n 
              { \linewidth/2 + \marginparsep , \textheight + \footskip - 1.5ex - #1 }
            \draw_path_use_clear:n { stroke }
            \draw_end:
          }
      }
    \skip_vertical:n { - \headsep - \headheight - 2.1ex }
  }

\chead [ \braun_twocolumn_page_box:n {3.6cm} ]{ \braun_twocolumn_page_box:n {0cm} }

\tl_set:Nn \l_braun_before_title_tl 
  { 
    \thispagestyle { plain.scrheadings }
    \skip_vertical:n {2.2em}
  }
\tl_set:Nn \l_braun_after_title_tl 
  {
    \skip_vertical:n {2.2em}
    \examrule
    \skip_vertical:n {1em}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   THE END!!!
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOff
