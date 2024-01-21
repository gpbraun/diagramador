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
	{ ita  }
	{ 2024 }
	{ 3.0  }
	{ Avaliação modelo ITA }

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
    DIV = 16, 
    fontsize = 10pt
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÃO DA PÁGINA
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tl_set:Nn \l_braun_before_title_tl 
  { 
    \skip_vertical:n {-3em}  
    \examrule\\[2ex]
  }
\tl_set:Nn \l_braun_after_title_tl {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CABEÇALHOS DE SEÇÕES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_set:Npn \SectionHeader
  #1 % -> título 
  {
    \begin{center}
      \text_uppercase:n {#1} \\
      \examrule
    \end{center}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   THE END!!!
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOff
