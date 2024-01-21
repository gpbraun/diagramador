%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Gabriel Braun, 2024
%
%   exam.cls
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { silence, xparse, l3draw }

\WarningFilter{latex}{Citation}

\ExplSyntaxOn

\ProvidesExplClass
	{ exam }
	{ 2024 }
	{ 3.0  }
	{ Simulados e gabaritos }

\LoadClass { scrartcl }

%============================================================%
%   CONFIGURAÇÕES GLOBAIS
%============================================================%

\keys_define:nn { exam }
  {
    linewidth .dim_set:N = \g_braun_linewidth_dim,
		linewidth .initial:n =  1pt,

    unknown .code:n  = \exp_args:NV \KOMAoption \l_keys_key_tl {#1}
  }

\NewDocumentCommand \examoptions { o m } 
  % #1 -> módulo
  % #2 -> configurações
  { \exp_args:Ne \keys_set:nn { exam \IfValueT {#1} {/#1} } {#2} }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   FONTES E TIPOGRAFIA
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage [T1] { fontenc }
% \RequirePackage { microtype }

\cs_new:Npn \HUGE { \@setfontsize \HUGE {27} {37} } 

\RequirePackage [  brazil  ] { babel }
\RequirePackage { csquotes }

\dim_zero:N    \parindent
\dim_set_eq:NN \parskip \bigskipamount

\setkomafont { section       } { \usekomafont { disposition } }
\setkomafont { subsection    } { \usekomafont { disposition } }
\setkomafont { subsubsection } { \usekomafont { disposition } }
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   PACOTES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage 
  {
    science,
    diagrams,
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        
%   FIGURAS E TABELAS
%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { graphicx, float, longtable, booktabs }

\tl_set:Nn \arraystretch {1.5}

\setkeys { Gin } { width=.8\textwidth, height=6cm, keepaspectratio }

\RenewDocumentEnvironment { figure } {} 
  { 
    \begin{center}
    \cs_set:Npn \caption ##1 { \relax }
  } 
  { 
    \end{center}   
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           
%   CONFIGURAÇÕES DE PÁGINA
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { scrlayer-scrpage, caption }

\ModifyLayer [ addvoffset = -0.7ex ] {       scrheadings.foot.above.line }
\ModifyLayer [ addvoffset = -0.7ex ] { plain.scrheadings.foot.above.line }

%============================================================%
%   FRAME NA PÁGINA
%============================================================%

\cs_new:Npn \examrule
  % linha horizontal
  {
    \noindent \exp_args:NVV \rule \linewidth \g_braun_linewidth_dim
  }

\cs_generate_variant:Nn \draw_linewidth:n {V}

\cs_set:Nn \braun_page_box:
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
            \draw_path_use_clear:n { stroke }
            \draw_end:
          }
      }
    \skip_vertical:n { - \headsep - \headheight - 2.1ex }
  }

%============================================================%
%   CABEÇALHO E RODAPÉ
%============================================================%

\setkomafont { pageheadfoot } { \bfseries }

\ihead {}
\chead {}
\ohead {}

\ifoot {}
\cfoot { \textbf{\thepage} }
\ofoot {}

\pagestyle { scrheadings }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CABEÇALHOS DE SEÇÕES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_set:Npn \SectionHeader    #1 {#1}
\cs_set:Npn \SubSectionHeader #1 {#1}

\cs_set:Npn \sectionlinesformat 
  #1 % -> level 
  #2 % -> indent
  #3 % -> number
  #4 % -> text
	{
    \str_case:nnF {#1}
			{
				{ section }
        {
          \SectionHeader {#4}
        }
        { subsection }
        {
          \SubSectionHeader {#4}
        }
			}
      {#4}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   AMBIENTES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================%
%   TEXTO (LINGUAGENS)
%============================================================%

\RequirePackage { lineno }

\RenewDocumentEnvironment { quote } {}
	{
    \dim_set_eq:NN \parindent     {  15 pt }
    \dim_set:Nn    \linenumbersep { -10 pt }

    \begin{addmargin}[20pt]{20pt}
    \begin{linenumbers}
	}
  {
    \end{linenumbers}
    \end{addmargin}
  }

%============================================================%
%   PROBLEMAS
%============================================================%

\newcounter { problem }

\cs_set:Npn \ProblemHeader
  #1 % -> pontuação do problema
  {
    \paragraph
      {
        Questão~ \arabic{problem}.
      }
  }

\NewDocumentEnvironment { problem } { O{} }
  {
		\refstepcounter { problem }
    \ProblemHeader  {#1}
    \cs_set:Npn \toprule {\\[-1em]}
  } 
  {
    \bigskip
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   LISTAS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { tasks, enumitem }

\cs_set_eq:NN \tightlist \relax

%============================================================%
%   DETERMINAÇÃO AUTOMÁTICA DO NÚMERO DE COLUNAS
%============================================================%

\int_new:N \g_braun_choice_cols_int
\dim_new:N \l_braun_choice_size_dim

% #1 -> sequencia de alternativas
\cs_new:Nn \braun_list_col_num:N
  {
    \seq_map_inline:Nn #1
      { % encontra o tamanho horizontal do maior item
        \hbox_set:Nn \l_tmpa_box {##1}
        \dim_set:Nn  \l_tmpa_dim { \box_wd:N \l_tmpa_box  } 

        \dim_compare:nNnT { \l_tmpa_dim } > { \l_braun_choice_size_dim }
          { \dim_set_eq:NN \l_braun_choice_size_dim \l_tmpa_dim }
      }

    \int_set:Nn \g_braun_choice_cols_int
      { % calcula o número de linhas
        \fp_to_int:n 
          { 
            ceil( \g__tasks_total_items_int /
            ceil( \g__tasks_total_items_int / 
            max(1, min(\g__tasks_total_items_int, floor(
              \dim_ratio:nn 
                { \columnwidth } 
                {
                  \l__tasks_item_indent_dim + 
                  \l_braun_choice_size_dim + 
                  \l__tasks_column_sep_dim
                }
            )))))
          } 
      }
  }

% Alteração do original: https://github.com/cgnieder/tasks/blob/master/tasks.sty
% #1 -> instance
% #2 -> number of columns
% #3 -> item separator
% #4 -> environment body
\cs_set_protected:Nn \tasks_environment:nnnn
  {
    \bool_if:NT \l__tasks_debug_bool { \dim_set:Nn \fboxsep {0pt} }
    \seq_set_split:Nnn \l__tasks_seq {#3} {#4}
  
    % usa o que está antes do primeiro \item antes da lista.
    \seq_pop_left:NN \l__tasks_seq \l_tmpa_tl
    \tl_use:N \l_tmpa_tl

    \tl_if_blank:VF \l__tasks_tmpa_tl
      { \msg_warning:nnVn {tasks}{no-item} \l__tasks_tmpa_tl {#3} }

    \int_gset:Nn \g__tasks_total_items_int
      { \seq_count:N \l__tasks_seq }

    \braun_list_col_num:N \l__tasks_seq

    \UseInstance {tasks} {#1}
      { \g__tasks_total_items_int }
      { \g_braun_choice_cols_int }
      { }

    \seq_clear:N \l__tasks_seq
  }

%============================================================%
%   DEFINIÇÃO DE LISTAS
%============================================================%

\NewTasksEnvironment
  [
    label = { \textbf{\Alph*} \; (\;\;)\; } ,
    item-indent = 4em,
    after-item-skip = 3\itemsep,
    label-width = 3em,
    label-align = right,
  ] 
  { choices } [\item ]

\def\labelenumii{\arabic{enumii}.}


\NewTasksEnvironment
  % Lista sem enumeração
  [
    label = { \bfseries\textbullet },  
  ] 
  { datalist } [ \item ]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   TÍTULO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setkomafont { title }      { \usekomafont { disposition } \Large }
\setkomafont { publishers } { \usekomafont { disposition } \large }
\setkomafont { date }       { \usekomafont { disposition } \large }

%============================================================%
%   PARÂMETROS DO TÍTULO
%============================================================%

%% TÍTULO
\tl_new:N \l_braun_title_tl
\cs_set:Npn \title #1 
  {
    \tl_gset:Nn \@title {#1}
    \tl_gset:Nn \l_braun_title_tl {#1}
  }

%% AUTOR
\tl_new:N \l_braun_author_tl
\cs_set:Npn \author #1 
  {
    \tl_gset:Nn \@author {#1}
    \tl_gset:Nn \l_braun_author_tl {#1}
  }
\author { Gabriel~ Braun }

%% DATA
\tl_new:N \l_braun_date_tl
\cs_set:Npn \date #1 
  {
    \tl_gset:Nn \@date {#1}
    \tl_gset:Nn \l_braun_date_tl {#1}
  }
\date { \int_use:N \c_sys_year_int }

%% AFFILIATION
\tl_new:N \l_braun_affiliation_tl
\cs_set:Npn \affiliation #1 
  {
    \tl_gset:Nn \@publishers {#1}
    \tl_gset:Nn \l_braun_affiliation_tl {#1}
  }

%% LOGO
\tl_new:N \l_braun_logo_left_tl
\cs_set:Npn \logoleft #1 
  {
    \tl_gset:Nn \l_braun_logo_left_tl {#1}
  }

\tl_new:N \l_braun_logo_right_tl
\cs_set:Npn \logoright #1 
  {
    \tl_gset:Nn \l_braun_logo_right_tl {#1}
  }

%============================================================%
%   COMANDO \maketitle
%============================================================%

\cs_new:Nn \braun_single_column:n
  % #1 -> conteúdo
  { 
    \legacy_if:nTF { @twocolumn } 
      { \twocolumn [ \mode_leave_vertical: #1 ] } 
      { \mode_leave_vertical: #1 } 
  }

\tl_new:N \l_braun_before_title_tl
\tl_new:N \l_braun_after_title_tl

\RenewDocumentCommand \maketitle { o }
  {
    \dim_gzero:N \@topnum 
    \group_begin:
    \braun_single_column:n
      {
        %% ANTES DO TÍTULO
        \l_braun_before_title_tl

        %% LOGO LEFT
        \begin{minipage}{ 2.5cm }
          \tl_if_empty:NF \l_braun_logo_left_tl
            {
              \raggedright
              \includegraphics [ width = 2.5cm, height = 2cm ] { \l_braun_logo_left_tl }
            }
        \end{minipage}

        %% TÍTULO PRINCIPAL
        \begin{minipage}{ \linewidth - 5cm }
          \centering
          {
            \group_begin:
            \usekomafont { title }
             \l_braun_title_tl  
            \group_end:
          }
          \par
          {
            \skip_vertical:n {1.0em}  
            \group_begin:
            \usekomafont { publishers }
             \l_braun_affiliation_tl
            \group_end:
          }
          \par
          {
            \skip_vertical:n {1.0em}  
            \group_begin:
            \usekomafont { date }
             \l_braun_date_tl
            \group_end:
          } 
        \end{minipage}

        %% LOGO RIGHT
        \begin{minipage}{ 2.5cm }
          \tl_if_empty:NF \l_braun_logo_right_tl
            {
              \raggedleft\hfill
              \includegraphics [ width = 2.5cm, height = 2cm ] { \l_braun_logo_right_tl }
            }
        \end{minipage}

        %% APÓS O TÍTULO
        \l_braun_after_title_tl
      }
    \group_end:
    \cs_undefine:N \maketitle
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   THE END!!!
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExplSyntaxOff
