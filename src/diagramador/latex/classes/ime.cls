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
	{ ime  }
	{ 2024 }
	{ 3.0  }
	{ Avaliação modelo IME }

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

\examoptions
  {
    DIV = 16, 
    fontsize = 10pt,
  }

\logoleft  { pensi-logo.pdf }
\logoright { ime-logo.pdf }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÃO DA PÁGINA
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tl_set:Nn \l_braun_before_title_tl { \skip_vertical:n {-1ex} }
\tl_set:Nn \l_braun_after_title_tl  {}

\chead [ \braun_page_box: ]{ \braun_page_box: }

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
    \draw_begin:
    \draw_linewidth:V \g_braun_linewidth_dim
    \hcoffin_set:Nn   \l_tmpa_coffin { \text_uppercase:n {#1} }
		\skip_horizontal:n { -\marginparsep }
    \draw_path_rectangle:nn 
      { 0cm  , 0cm }
      { \linewidth + 2 \marginparsep ,  \coffin_ht:N \l_tmpa_coffin + 1em }
    \color_fill:n { white }
    \draw_path_use_clear:n { stroke, fill }
    \draw_transform_shift:n 
      { \linewidth / 2 + \marginparsep ,  0.5em }
    \draw_coffin_use:Nnn \l_tmpa_coffin {hc} {H}
    \draw_end:
  }

\cs_set:Npn \ProblemHeader
  #1 % -> pontuação do problema
  {
    \subsection* {} \skip_vertical:n {-40pt}
    \draw_begin:
    \draw_linewidth:V \g_braun_linewidth_dim
    \hcoffin_set:Nn   \l_tmpa_coffin 
      { 
        \usekomafont { disposition }
        \arabic{problem} \textsuperscript {a}~ QUESTÃO 
      }
    \hcoffin_set:Nn   \l_tmpb_coffin 
      { 
        \skip_horizontal:n {20pt}
        \usekomafont { disposition }
        Valor:~ #1 
        \skip_horizontal:n {20pt}
      }
		\skip_horizontal:n { -\marginparsep }
    \draw_path_rectangle:nn 
      { 0cm , 0cm }
      { \linewidth + 2 \marginparsep , \coffin_ht:N \l_tmpb_coffin + 1em }
    \color_fill:n { white }
    \draw_path_use_clear:n { stroke, fill }
    \draw_transform_shift:n 
      { \linewidth - \coffin_wd:N \l_tmpb_coffin , 0.0cm }
    \draw_path_moveto:n 
      { 0cm , 0cm }
    \draw_path_lineto:n 
      { 0cm , \coffin_ht:N \l_tmpb_coffin + 1em }
    \draw_path_use_clear:n { stroke }
    \draw_transform_shift:n 
      { \coffin_wd:N \l_tmpb_coffin + \marginparsep , 0.5em }
    \draw_coffin_use:Nnn \l_tmpb_coffin {r}  {H}
    \draw_transform_shift:n 
      { -\linewidth , 0cm }
    \draw_coffin_use:Nnn \l_tmpa_coffin {l} {H}
    \draw_end:
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   THE END!!!
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOff
