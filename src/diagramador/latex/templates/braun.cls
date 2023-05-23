%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ______                       _____ _                      %
%  | ___ \                     /  __ \ |                     %
%  | |_/ /_ __ __ _ _   _ _ __ | /  \/ |__   ___ _ __ ___    %
%  | ___ \ '__/ _` | | | | '_ \| |   | '_ \ / _ \ '_ ` _ \   %
%  | |_/ / | | (_| | |_| | | | | \__/\ | | |  __/ | | | | |  %
%  \____/|_|  \__,_|\__,_|_| |_|\____/_| |_|\___|_| |_| |_|  %
%                                                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  The BRAUN Package
%
%          --  Problem Sheet Typesetting -- 
%
%============================================================%
%
%  GABRIEL P. BRAUN, 2019-2023
%
%============================================================%
%
%  CONTACT: braun.pineschi@gmail.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CLASS REQUIREMENTS AND SETUP                   
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { l3keys2e, l3draw, l3graphics }

\ExplSyntaxOn

\tl_const:Nn \c_brauntex_date_tl                 {2022/02/02}
\tl_const:Nn \c_brauntex_version_major_number_tl {8}
\tl_const:Nn \c_brauntex_version_minor_number_tl {0}
\tl_const:Nn \c_brauntex_version_subrelease_tl   {a}
\tl_const:Nx \c_brauntex_version_number_tl
	{
    \c_brauntex_version_major_number_tl .
    \c_brauntex_version_minor_number_tl
	}
\tl_const:Nx \c_brauntex_version_tl
	{
		\c_brauntex_version_number_tl
		\c_brauntex_version_subrelease_tl
	}
\tl_const:Nn \c_brauntex_info_tl { BraunTex Class }

\ProvidesExplClass
	{ braun }
	{ \c_brauntex_date_tl    }
	{ \c_brauntex_version_tl }
	{ \c_brauntex_info_tl    }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   MACROS                 
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================%
%   GENERAL USAGE
%============================================================%

\cs_set:Npn \BraunNoWarning % Avoid badness errors
  { 
      \dim_set_eq:NN \vfuzz    \c_max_dim
      \dim_set_eq:NN \hfuzz    \c_max_dim
      \int_set_eq:NN \hbadness \c_max_int
      \int_set_eq:NN \vbadness \c_max_int
  }

%============================================================%
%   VARIANTS OF KERNEL FUNCTIONS
%============================================================%

\cs_generate_variant:Nn \box_autosize_to_wd_and_ht:Nnn {NVV}
\cs_generate_variant:Nn \dim_compare:nNnF {vNVF}
\cs_generate_variant:Nn \draw_linewidth:n {V}
\cs_generate_variant:Nn \coffin_typeset:Nnnnn {NnVnV}
\cs_generate_variant:Nn \color_fill:n {V}
\cs_generate_variant:Nn \color_stroke:n {V}
\cs_generate_variant:Nn \color_select:n {e}
\cs_generate_variant:Nn \color_select:n     {V}
\cs_generate_variant:Nn \clist_put_right:Nn {Ne}
\cs_generate_variant:Nn \seq_use:Nnnn {cvvv}
\cs_generate_variant:Nn \skip_vertical:n {V}
\cs_generate_variant:Nn \prop_get:NnNTF {NVNTF}
\cs_generate_variant:Nn \vcoffin_set:Nnn {NVn}

%============================================================%
%   BASE CLASS
%============================================================%

\tl_const:Nn \c_brauntex_base_class_tl { scrartcl }
\exp_args:NV \LoadClass \c_brauntex_base_class_tl

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CLASS              
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\keys_define:nn { braun }
  {
    language .code:n    = \PassOptionsToPackage {#1} { babel },
    language .initial:n = brazil,

    linewidth .dim_set:N = \g_braun_linewidth_dim,
		linewidth .initial:n =  0.4pt,
  }

% #1 -> module
% #2 -> keys
\NewDocumentCommand \braunsetup { o m } 
  { \exp_args:Ne \keys_set:nn { braun \IfValueT {#1} {/#1} } {#2} }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   FONTS       
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\keys_define:nn { braun }
  {
    familydefault .tl_set:N = \g_braun_family_default_tl,

    font .tl_set:N  = \g_braun_font_tl,
    font .initial:n = ptsans,

    emph .code:n = \cs_gset:Npn \emph ##1 { { #1 ##1 } },
  }

\cs_set:Nn \braun_select_font:
  {
    \str_case:Vn \g_braun_font_tl
      {
        { lmodern }
        { 
          \RequirePackage { lmodern }
        }
        { ptsans }
        {
          \RequirePackage { lmodern }
          \RequirePackage [ scaled ] { PTSans }
        }
        { firasans }
        {
          \RequirePackage { lmodern }
          \RequirePackage [ scaled ] { FiraSans }
        }  
        { helvetica }
        { 
          \RequirePackage { lmodern }
          \RequirePackage [ scaled  ] { helvet }
        }
        { prova }
        { 
          \RequirePackage { crimson }
          \RequirePackage { eulervm }
          \RequirePackage { FiraSans }
        }       
      }
  % family default
    \str_case:Vn \g_braun_family_default_tl
      {
        { rm } { \cs_gset_eq:NN \familydefault \rmdefault }
        { sf } { \cs_gset_eq:NN \familydefault \sfdefault }
      }
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   BASICO
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================%
%   TIPOGRAFIA
%============================================================%

\RequirePackage [T1] { fontenc }

%============================================================%
%   KOMASCRIPT
%============================================================%

\keys_define:nn { braun }
  { unknown .code:n  = \exp_args:NV \KOMAoption \l_keys_key_tl {#1} }

%============================================================%
%   FIGURAS E TABELAS
%============================================================%

\RequirePackage { float, longtable, booktabs }

%============================================================%
%   MATH
%============================================================%

\RequirePackage { mathtools, amssymb, textcomp }

\numberwithin { equation } { section }

\cs_set_eq:NN \degree \textdegree

\RequirePackage [ thicklines ] { cancel }

\cs_set:Npn \CancelColor { \color { red } }

\cs_undefine:N \sin
\DeclareMathOperator{\sin}{sen}

%============================================================%
%   UNIDADES DO SI
%============================================================%

\RequirePackage { siunitx }

\sisetup 
  { 
    range-phrase = { a }, 
    list-final-separator = { e }, 
    locale = FR,
    retain-explicit-plus,
    exponent-product = \cdot,
  }

\cs_set_eq:NN \pu \mathrm

%============================================================%
%   QUÏMICA
%============================================================%

\RequirePackage [ version=4 ] { mhchem }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   DIAGRAMAS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage [ table ] { xcolor }
\RequirePackage { tikz, pgfplots, tcolorbox }

\RequirePackage { braunchem }

%============================================================%
%   BIBLIOTECAS ADICIONAIS DO TIKZ/PGFPLOTS
%============================================================%

\tcbuselibrary { skins, breakable }

\tcbset { enhanced~jigsaw }

\AtBeginDocument 
  {
    \usepgfplotslibrary
      { 
        groupplots, 
        fillbetween 
      }
    \usetikzlibrary
      {
        calc,
        calc,
        shapes,
        decorations,
        arrows,
        shapes.geometric, 
        decorations.text,
        decorations.pathreplacing,
        decorations.markings,
        decorations.pathmorphing,
        arrows.meta,
      }
  }

%============================================================%
%   PALETA DE CORES (BOOTSTRAP)
%============================================================%

% CORES BÁSICAS
\definecolor { blue   } { HTML } { 0d6efd }
\definecolor { indigo } { HTML } { 6610f2 }
\definecolor { purple } { HTML } { 6f42c1 }
\definecolor { pink   } { HTML } { d63384 }
\definecolor { red    } { HTML } { dc3545 } 
\definecolor { orange } { HTML } { fd7e14 } 
\definecolor { yellow } { HTML } { f9c21c } 
\definecolor { green  } { HTML } { 198754 } 
\definecolor { teal   } { HTML } { 20c997 } 
\definecolor { cyan   } { HTML } { 0dcaf0 } 
\definecolor { gray   } { HTML } { adb5bd } 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CABEÇALHOS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\coffin_new:N \l__braun_txta_coffin
\coffin_new:N \l__braun_txtb_coffin

% #1 -> name
% #2 -> code
\NewDocumentCommand \DeclareBraunHeader { m m }
	{
		\exp_args:Nc \NewDocumentCommand { \char_uppercase:N #1 Header } { o m }
			{
				\skip_vertical:n { 1ex } 
				\group_begin:
        \dim_zero:N \parindent
        \draw_begin:
        \draw_linewidth:V \g_braun_linewidth_dim
        \hcoffin_set:Nn   \l__braun_txta_coffin {##2}
        \hcoffin_set:Nn   \l__braun_txtb_coffin {##1}
        #2
        \draw_end:
				\group_end:
				\skip_vertical:n { 1ex } 
			}
	}
    
%% CABEÇALHO IME CENTRALIZADO
\DeclareBraunHeader { IME }
  {
    \skip_horizontal:n { -\marginparsep }
    \draw_path_rectangle:nn 
      { 0cm  , 0cm }
      { \linewidth + 2 \marginparsep ,  \coffin_ht:N \l__braun_txtb_coffin + 1em }
    \color_fill:n { white }
    \draw_path_use_clear:n { stroke, fill }
    \draw_transform_shift:n 
      { \linewidth / 2 + \marginparsep ,  0.5em }
    \draw_coffin_use:Nnn \l__braun_txta_coffin {hc} {H}
  }

%% CABEÇALHO IME NORMAL (PROBLEMAS)
\DeclareBraunHeader { IMEproblem }
    {
      \skip_horizontal:n { -\marginparsep }
      \draw_path_rectangle:nn 
        { 0cm , 0cm }
        { \linewidth + 2 \marginparsep , \coffin_ht:N \l__braun_txtb_coffin + 1em }
      \color_fill:n { white }
      \draw_path_use_clear:n { stroke, fill }
      \draw_transform_shift:n 
        { \linewidth - \coffin_wd:N \l__braun_txtb_coffin , 0.0cm }
      \draw_path_moveto:n 
        { 0cm , 0cm }
      \draw_path_lineto:n 
        { 0cm , \coffin_ht:N \l__braun_txtb_coffin + 1em }
      \draw_path_use_clear:n { stroke }
      \draw_transform_shift:n 
        { \coffin_wd:N \l__braun_txtb_coffin + \marginparsep , 0.5em }
      \draw_coffin_use:Nnn \l__braun_txtb_coffin {r}  {H}
      \draw_transform_shift:n 
        { -\linewidth , 0cm }
      \draw_coffin_use:Nnn \l__braun_txta_coffin {l} {H}
    }

%% CABEÇALHO DE QUESTÃO PENSI
\DeclareBraunHeader { Pensi }
  {
    % rectangle
		\draw_path_rectangle:nn 
      { 0cm , 0cm }
      { \linewidth, \coffin_ht:N \l__braun_txta_coffin + 1em }
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
		\draw_coffin_use:Nnn \l__braun_txta_coffin {l} {H}
  }

%% CABEÇALHO DE TÍTULO PENSI
\DeclareBraunHeader { PensiTitle }
  {
		\draw_path_rectangle:nn 
      { 0cm , 0cm }
      { \linewidth , 3 \coffin_ht:N \l__braun_txta_coffin}
		\color_fill:n { black!10 }
		\draw_path_use_clear:n { stroke, fill }
		\draw_transform_shift:n 
			{ 0.5 \linewidth , 1.5 \coffin_ht:N \l__braun_txta_coffin }
		\draw_coffin_use:Nnn \l__braun_txta_coffin {hc} {vc}
		\draw_path_lineto:n 
			{ \linewidth, 0cm }
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   PAGE LAYOUT
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { scrlayer-scrpage, multicolrule, caption }

%============================================================%
%   COLUMN SEPARATOR
%============================================================%

\keys_define:nn { braun/page/mcrule }
  { 
    black .meta:n = 
      {
        line-style  = solid,
        width       = thick,
        color       = black,
        extend-bot  = 10cm,
      },

    unknown .code:n = \exp_args:Ne \SetMCRule { \l_keys_key_tl = #1 },
  }

\SetMCRule{extend-top = 1cm}

%============================================================%
%   HEADER
%============================================================%

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


\keys_define:nn { braun/page }
  {
    headfoot-font .code:n    = \setkomafont { pageheadfoot } {#1},
    headfoot-font .initial:n =  ,

    boxed .bool_set:N = \l_braun_boxed_page_bool ,
    boxed .initial:n  = false,
    boxed .default:n  = true,

    columnsep .dim_set:N = \columnsep,
    columnsep .initial:n = 2em,
  }

%============================================================%
%   HEADER
%============================================================%

\keys_define:nn { braun/page/header }
  {
    sepline .choices:nn = { true, false }
      {
        \exp_args:Nne \KOMAoption { headsepline }
          {  
            \str_if_eq:nnTF {#1} { true } 
              { \dim_use:N \g_braun_linewidth_dim } 
              { false }
          }
      },
    sepline .initial:n = false,
    sepline .default:n = true,

    title-sepline .choices:nn = { true, false } 
      { \KOMAoption { plainheadsepline } {#1} },
    title-sepline .initial:n = false,
    title-sepline .default:n = true,

    font .code:n    = \setkomafont { pagehead } {#1},
    font .initial:n =  ,

    inner  .tl_set:N  = \l_braun_page_ihead_tl ,
    center .tl_set:N  = \l_braun_page_chead_tl ,
    outer  .tl_set:N  = \l_braun_page_ohead_tl ,

    title-inner  .tl_set:N  = \l_braun_page_title_ihead_tl ,
    title-center .tl_set:N  = \l_braun_page_title_chead_tl ,
    title-outer  .tl_set:N  = \l_braun_page_title_ohead_tl ,

    plain .meta:n = 
      { 
        inner  = ,
        center = ,
        outer  = ,
        sepline = false,
        title-inner  = ,
        title-center = ,
        title-outer  = ,
        title-sepline = false,
      },

    pensi .meta:n = 
      {
        inner  = 
          {
            \group_begin:
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
                  \large\bfseries\sffamily
                  \PrintTitle
                };
            \end{tikzpicture}
            \group_end:
          },
          center = ,
          outer  = ,
          sepline = false,
          title-inner  = ,
          title-center = ,
          title-outer  = ,
          title-sepline = false,
    }
  }

\ihead 
  [ \tl_use:N \l_braun_page_title_ihead_tl ] 
  { \tl_use:N \l_braun_page_ihead_tl }
\chead
  [   
      \bool_if:NT \l_braun_boxed_page_bool { \braun_page_box: } 
      \tl_use:N \l_braun_page_title_chead_tl
  ]
  {
      \bool_if:NT \l_braun_boxed_page_bool { \braun_page_box: }   
      \tl_use:N   \l_braun_page_chead_tl
  }
\ohead 
  [ \tl_use:N \l_braun_page_title_ohead_tl ] 
  { \tl_use:N \l_braun_page_ohead_tl }

%============================================================%
%   FOOTER
%============================================================%

\keys_define:nn { braun/page/footer }
  {
      sepline .choices:nn = { true, false } 
        {
          \exp_args:Nne \KOMAoption { footsepline }
            {  
              \str_if_eq:nnTF {#1} { true } 
                { \dim_use:N \g_braun_linewidth_dim } 
                { false }
            }
        },
      sepline .initial:n = false,
      sepline .default:n = true,

      title-sepline .choices:nn = { true, false } 
        {
          \KOMAoption { plainfootsepline } {#1}
        },
      title-sepline .initial:n = false,
      title-sepline .default:n = true,

      font .code:n    = \setkomafont { pagefoot } {#1},
      font .initial:n =  {},

      inner  .tl_set:N  = \l_braun_page_ifoot_tl ,
      center .tl_set:N  = \l_braun_page_cfoot_tl ,
      center .initial:n = { \thepage },
      outer  .tl_set:N  = \l_braun_page_ofoot_tl ,

      title-inner  .tl_set:N  = \l_braun_page_title_ifoot_tl ,
      title-center .tl_set:N  = \l_braun_page_title_cfoot_tl ,
      title-center .initial:n = { \thepage },
      title-outer  .tl_set:N  = \l_braun_page_title_ofoot_tl ,

      plain .meta:n = 
        { 
          inner  = ,
          center = {\thepage},
          outer  = ,
          sepline = false,
          title-inner  = ,
          title-center = {\thepage},
          title-outer  = ,
          title-sepline = false,
        },

  pensi .meta:n = 
    {
      inner  = ,
      center = { \textbf{\thepage} },
      outer  = ,
      sepline = false,
      title-inner  = ,
      title-center = { \textbf{\thepage} },
      title-outer  = ,
      title-sepline = false,
    }
  }

\ifoot 
  [ \tl_use:N \l_braun_page_title_ifoot_tl ] 
  { \tl_use:N \l_braun_page_ifoot_tl       }
\cfoot 
  [ \tl_use:N \l_braun_page_title_cfoot_tl ] 
  { \tl_use:N \l_braun_page_cfoot_tl       }
\ofoot 
  [ \tl_use:N \l_braun_page_title_ofoot_tl ] 
  { \tl_use:N \l_braun_page_ofoot_tl       }

\ModifyLayer [ addvoffset = -0.7ex ] {       scrheadings.foot.above.line }
\ModifyLayer [ addvoffset = -0.7ex ] { plain.scrheadings.foot.above.line }

%============================================================%
%   SECTIONS
%============================================================%

\keys_define:nn { braun/page/section }
	{
		template .tl_set:N = \l_braun_page_section_type_tl,
		template .initial:n = latex,
	}

\cs_set_eq:NN \legacysection \section

\RenewDocumentCommand \section { s m }
	{
    \IfBooleanF {#1} { \refstepcounter { section } }
    \group_begin:
		\braun_ghost_section: 

    \str_case:Vn \l_braun_page_section_type_tl
			{
				{ latex }
				{
					\Large \textbf {#2}
				}
				{ prova }
				{
					\PensiTitleHeader 
						{
							\LARGE
							\bfseries
							\sffamily
							\text_uppercase:n {#2} 
						}
				}
				{ gabarito }
				{
					\PensiTitleHeader 
						{
							\large
							\bfseries
							\sffamily
							\text_uppercase:n {#2} 
						}
				}
				{ IME }
				{
					\skip_vertical:n {-5pt}
					\IMEHeader 
						{ 
							\bfseries 
							\normalsize  
							\text_uppercase:n {#2} 
						} 
				}
        { AFA }
				{
					\begin{center}
						\bfseries \normalsize \text_uppercase:n {#2} \\[-1ex]
            \noindent 
            \rule{0.3\linewidth}{\g_braun_linewidth_dim}
					\end{center}
				}
				{ ITA }
				{
					\begin{center}
						\bfseries \normalsize \text_uppercase:n {#2} \\
						\braun_horizontal_rule:
					\end{center}
				}
			}
      \group_end:
	}

%============================================================%
%   PAGE STYLE TEMPLATES
%============================================================%

\keys_define:nn { braun/page }
  {
    IME .meta:n = 
      {
          header / plain,
          footer / plain,
          boxed = true,
          section / template = IME,
      },
    AFA .meta:n = 
      {
          header / plain,
          footer / plain,
          boxed = true,
          section / template = AFA,
      }
  }

\pagestyle { scrheadings }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   TITLE
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================%
%   TITLE ELEMENTS
%============================================================%

% #1 -> sequence variable
% #2 -> separation
\cs_set:Nn \braun_select_sep:Nn
    {
      \str_case:nn {#2}
        {
          { csv    } { \seq_use:Nn #1   { ,  } }
          { break  } { \seq_use:Nn #1   { \\  } }
				  { normal } { \seq_use:Nnnn #1 { e } { , } { ,e } }
        }
    }
\cs_generate_variant:Nn \braun_select_sep:Nn {cv}
\cs_generate_variant:Nn \braun_select_sep:Nn {cn}

% #1 -> text input
% #2 -> text case
\cs_set:Nn \braun_select_case:nn
  {
    \str_case:nnF {#2}
      {
        { upper } { \text_uppercase:n {#1} }
        { lower } { \text_lowercase:n {#1} }
        { title } { \text_titlecase:n {#1} }
        { first } { \text_titlecase_first:n {#1} }
      } {#1}
  }
\cs_generate_variant:Nn \braun_select_case:nn {ev}

% #1 m -> title element name
\NewDocumentCommand \NewTitleElement { o m }
    {
		\seq_new:c  { l_braun_title_#2_value_seq  }
		\bool_new:c { l_braun_title_#2_input_bool }
        \keys_define:nn { braun/maketitle/#2 }
        {
                value .code:n = 
					{ 
						\bool_if:cT { l_braun_title_#2_single_bool }
							{ \seq_clear:c { l_braun_title_#2_value_seq } }
						\seq_put_right:cn { l_braun_title_#2_value_seq } {##1} 
					},
				
				single-value .bool_set:c  = { l_braun_title_#2_single_bool },
				single-value .initial:n   = false,
				single-value .default:n   = true,

        font .tl_set:c   = { l_braun_title_#2_font_tl },

        case .choices:nn = { upper, lower, title, first, none }
            { \tl_set:cn { l_braun_title_#2_case_tl } {##1} },
        case .initial:n  = first,

        sep .choices:nn = { normal, csv, break }
            { \tl_set:cn { l_braun_title_#2_sep_tl } {##1} },
        sep .initial:n  = normal,

        sort .bool_set:c = { l_braun_title_#2_sort_bool },
        sort .initial:n  = false,
				sort .default:n  = true,

                pre-text  .tl_set:c = { l_braun_title_#2_pre_text_tl  },
				post-text .tl_set:c = { l_braun_title_#2_post_text_tl },

                before-skip .skip_set:c = { l_braun_title_#2_before_skip },
                before-skip .initial:n  = 0.5em,
				after-skip  .skip_set:c = { l_braun_title_#2_after_skip  },
                after-skip  .initial:n  = 0.5em,
            }
		% Change default keys for the title element
		\IfNoValueF {#1} { \keys_set:nn { braun/maketitle/#2 } {#1} }
        % Set the title element value
        \cs_gset:cpn {#2} ##1 
			{  
				\bool_set_true:c { l_braun_title_#2_input_bool }
				\keys_set:nn { braun/maketitle/#2 }{ value = \exp_not:n {##1} } 
				% LaTeX2e compatibility
				\cs_if_exist:cT {@#2} { \cs_set:cpn {@#2} {##1} } 
			}
        % Print title element value
      	\cs_new:cpn { Print \char_uppercase:N #2 }
            {
				\bool_if:NTF \l_braun_if_maketitle_bool
				{ % inside \maketitle
					\use:c { braun_maketitle_print_#2 }
				}
				{ % outside \maketitle
					\seq_if_empty:cF { l_braun_title_#2_value_seq }
						{
							\braun_select_sep:cn 
								{ l_braun_title_#2_value_seq } { normal } 
						}
				}
            }
		% Print title element value inside \maketitle
		\cs_new:cpn { braun_maketitle_print_#2 }
            {
				\seq_if_empty:cF { l_braun_title_#2_value_seq }
          {
						\group_begin:
            \dim_compare:vNVF 
              { l_braun_title_#2_before_skip } = \c_zero_dim
              {
                \skip_vertical:c 
                  { l_braun_title_#2_before_skip }
              }
            \exp_not:n 
              { \tl_use:c { l_braun_title_#2_font_tl } }
            \tl_use:c  { l_braun_title_#2_pre_text_tl } 
            \braun_select_case:ev
              { 
                \braun_select_sep:cv
                  { l_braun_title_#2_value_seq } 
                  { l_braun_title_#2_sep_tl    } 
              } 
              { l_braun_title_#2_case_tl  }
            \tl_use:c { l_braun_title_#2_post_text_tl } 
            \dim_compare:vNVF 
              { l_braun_title_#2_before_skip } = \c_zero_dim
              {
                \skip_vertical:c 
                  { l_braun_title_#2_after_skip }
              }
						\group_end:
          }
				\cs_undefine:c { #2 }
			}
    }

%% DEFAULT TITLE ELEMENTS

\NewTitleElement 
	[ font = \LARGE\bfseries ] 
	{ title }

\NewTitleElement 
	[ font = \large\bfseries ] 
	{ affiliation }

\NewTitleElement 
	[ font = \LARGE\bfseries ] 
	{ code }

\NewTitleElement 
	[ font = \large ]
	{ class }

\NewTitleElement 
	[ case = none, single-value ]
	{ date }

%============================================================%
%   LOGO
%============================================================%

\seq_new:N \g_braun_logo_value_seq

\keys_define:nn { braun/maketitle/logo }
	{
		value .code:n = { \seq_put_right:Nn \g_braun_logo_value_seq {#1} },

		height .dim_set:N = \l_braun_logo_height_dim ,
		height .initial:n = 2.5cm,

		width .dim_set:N = \l_braun_logo_width_dim ,
		width .initial:n = 3cm,
	}

%% SET LOGO

% #1 -> logo name/value
\cs_set:Npn \logo #1
    { \keys_set:nn { braun/maketitle/logo } { value = #1 } }

\coffin_new:N \l_braun_title_logo_r_coffin
\coffin_new:N \l_braun_title_logo_l_coffin

% #1 -> coffin to revieve logo
\cs_set:Npn \braun_set_logo_coffin:N #1
	{
		\group_begin:
    \seq_gpop_left:NNT \g_braun_logo_value_seq \l_tmpa_tl
      {
        \braun_set_logo_box:N \l_tmpa_box
        \hcoffin_gset:Nn #1 { \box_use_drop:N \l_tmpa_box }
      }
		\group_end:
	}
	
%% PRINT LOGO

% #1 -> box to recieve logo
\cs_set:Npn \braun_set_logo_box:N #1
{
  \hbox_set:Nn #1
    {
      \group_begin:
      \prop_get:NVNTF \l_braun_logos_prop \l_tmpa_tl \l_tmpb_tl 
        { \tl_use:N \l_tmpb_tl } 
        { \tl_use:N \l_tmpa_tl }
      \group_end:
    }
  \box_autosize_to_wd_and_ht:NVV #1 \l_braun_logo_width_dim \l_braun_logo_height_dim
}

% #1 -> logo name/value
\cs_new:Npn \PrintLogo #1 
  {
    \group_begin:
      \braun_set_logo_box:N \l_tmpa_box
      \hcoffin_set:Nn       \l_tmpa_coffin { \box_use_drop:N \l_tmpa_box }
      \coffin_typeset:N     \l_tma_coffin  {l} {H} {0pt} {0pt}
    \group_end:
  }

%% PREDEFINED LOGOS
\prop_const_from_keyval:Nn \l_braun_logos_prop
	{
		pensi   = \includegraphics { pensi-logo.pdf },
		ime     = \includegraphics { ime-logo.pdf },
    afa     = \includegraphics { afa-logo.png },
		ita     = \includegraphics { ita-logo.pdf },
    ita-alt = \includegraphics { ita-logo-alt.pdf },
	}

%============================================================%
%   PRINT TITLE
%============================================================%

\keys_define:nn { braun/maketitle }
	{
		template .tl_set:N = \l_braun_title_template_tl,
		template .initial:n  = plain,

		align .choices:nn = { c, l, r }
			{ \tl_set:Nn \l_braun_title_align_tl {#1} },
		align .initial:n  = c,

		print .clist_set:N = \l_braun_title_print_clist,
		print .initial:n   = { title, subtitle, author, affiliation, date },

		pre-text  .tl_set:N = \l_braun_title_pre_text_tl,
		post-text .tl_set:N = \l_braun_title_post_text_tl,

		toprule .bool_set:N = \l_braun_title_toprule_bool,
		toprule .initial:n  = false,
		toprule .default:n  = true,
		
		botrule .bool_set:N = \l_braun_title_botrule_bool,
		botrule .initial:n  = false,
		botrule .default:n  = true,

		before-skip .skip_set:N = \l_braun_title_before_skip,
		before-skip .initial:n  = 0.5em,
		after-skip  .skip_set:N = \l_braun_title_after_skip,
		after-skip  .initial:n  = 0.5em,
	}

\cs_new:Npn \braun_horizontal_rule:
% linha horizontal
  {
    \noindent \exp_args:NVV \rule \linewidth \g_braun_linewidth_dim
  }

% #1 -> conteúdo
\cs_new:Nn \braun_single_column:n
  { 
    \legacy_if:nTF { @twocolumn } 
      { \twocolumn [ \mode_leave_vertical: #1 ] } 
      { \mode_leave_vertical: #1 } 
  }

%% MAKETITLE COMMAND
\coffin_new:N \l_braun_title_coffin
\bool_new:N   \l_braun_if_maketitle_bool

\RenewDocumentCommand \maketitle { o }
  {
		\group_begin:
		\bool_set_true:N \l_braun_if_maketitle_bool
		\BraunNoWarning
		\dim_zero:N  \parindent
		\dim_gzero:N \@topnum % Prevents figures from going at top of page.

		% Set keys
		\IfNoValueF {#1} { \keys_set:nn { braun/maketitle } {#1} }

		\tl_use:N \l_braun_title_pre_text_tl

		\str_case:VnF \l_braun_title_template_tl
      {
				{ pensi }
        { 
					\bool_set_false:N \l_braun_if_maketitle_bool
					\raggedright \normalfont
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
									\LARGE
									\sffamily
									\bfseries
									\PrintTitle
								\group_end:
								\\[1ex]
								\group_begin:
									\large
									\sffamily
									\bfseries
									\PrintAffiliation
								\group_end:
							};
						\fill [yellow] 
							($(titlebox.north~ east) + (5pt, 0)$) rectangle 
							($(titlebox.south~ east) + (10pt, 0)$);
						\fill [yellow] 
							($(titlebox.north~ east) + (15pt, 0)$) rectangle 
							($(titlebox.south~ east) + (1cm, 0)$);
					\end{tikzpicture}
					\skip_vertical:n { 5em }
        }         
      }
      {
				\str_if_eq:VnTF \l_braun_title_align_tl {r}
					{ 
						% frist logo on the right
						\braun_set_logo_coffin:N \l_braun_title_logo_l_coffin
						\braun_set_logo_coffin:N \l_braun_title_logo_r_coffin
					}
					{ 
						% frist logo on the left
						\braun_set_logo_coffin:N \l_braun_title_logo_r_coffin
						\braun_set_logo_coffin:N \l_braun_title_logo_l_coffin
					}		
				% Main title coffin
				\vcoffin_set:Nnn \l_braun_title_coffin
					{ \textwidth }
					{
						\str_case:Vn \l_braun_title_align_tl
							{
								{ c } { \centering 	 }
								{ l } { \raggedright }
								{ r } { \raggedleft  }
							}
						%% Print title elements specified by \l_braun_title_print_clist
						\clist_map_inline:Nn \l_braun_title_print_clist 
							{ \use:c { braun_maketitle_print_##1 } }
					}
				% Join coffins
				\coffin_join:NnnNnnnn \l_braun_title_coffin {vc} {r}	
					\l_braun_title_logo_r_coffin {vc} {r} {0pt} {0pt}
				\coffin_join:NnnNnnnn \l_braun_title_coffin {vc} {l}	
					\l_braun_title_logo_l_coffin {vc} {l} {0pt} {0pt}
				% Print title
				\braun_single_column:n
					{
            \skip_vertical:n { -1.5em }

						\bool_if:NT      \l_braun_title_toprule_bool { \braun_horizontal_rule: }
						\skip_vertical:V \l_braun_title_before_skip

						\coffin_typeset:Nnnnn \l_braun_title_coffin {l} {vc} {0pt} {0pt}

						\skip_vertical:V \l_braun_title_after_skip
						\bool_if:NT      \l_braun_title_botrule_bool 
              {
                \bool_if:NTF \l_braun_boxed_page_bool
                {
                  \skip_vertical:n { 1ex }
                  \noindent
                  \hspace{-\marginparsep}
                  \rule {\linewidth + 2 \marginparsep} {\g_braun_linewidth_dim}
                }
                {
                  \braun_horizontal_rule: 
                }    
              }

						\skip_vertical:n { 2.0em }
					}
      }
		\tl_use:N \l_braun_title_post_text_tl
		\group_end:
    \cs_undefine:N \maketitle
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   FIGURAS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setkeys { Gin } { width=.8\textwidth, height=5cm, keepaspectratio }

\cs_set_eq:NN \legacyincludegraphics \includegraphics 

\DeclareDocumentCommand \includegraphics { O{} m }
  { 
    \group_begin:
    \file_parse_full_name:nNNN {#2} \l_tmpa_tl \l_tmpb_tl \l_tmpc_tl
    \legacyincludegraphics [#1] { \l_tmpb_tl \l_tmpc_tl }
    \group_end:
  }

\RenewDocumentEnvironment { figure } {} 
  { 
    \group_begin:
    \cs_set:Npn \caption ##1 { \relax }
    \begin{center}   
  } 
  { 
    \end{center} 
    \group_end:
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   LISTAS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { tasks, enumitem }

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
    item-indent = 4 em,
    after-item-skip = 2\itemsep,
    label-width = 3 em,
    label-align = right,
  ] 
  { choices } [\item ]

% \def\labelenumii{\arabic{enumii}.}

% \RenewTasksEnvironment
%   [
%     counter = enumii,
%     label = { \labelenumii },
%     after-item-skip = 1.5\itemsep,
%   ] 
%   { enumerate } [\item ]

\RenewTasksEnvironment
  [
    label = { \textbullet},
    after-item-skip = 1.5\itemsep,
  ] 
  { itemize } [\item ]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   PROBLEMS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\keys_define:nn { braun/problems }
  {
    name .tl_set:N = \l_braun_problem_name_tl,
    name .initial:n = Problema,

    points .fp_set:N = \g_braun_problem_points_fp,
    points .initial:n = 1.00,

    id .tl_set:N = \l_braun_problem_id_tl,
    id .initial:n = ,

    template .tl_set:N = \l_braun_problem_template_tl,
    template .initial:n = braun,

    skip-after .dim_set:N = \l_braun_problem_after_skip,
    skip-after .initial:n = 2em,

    breakable .bool_set:N = \l_braun_problem_breakable_bool,
    breakable .initial:n  = false,
    breakable .default:n  = true,

		vfill .bool_set:N = \l_braun_problem_fill_bool,
    vfill .initial:n  = true,
    vfill .default:n  = true,
  }

%============================================================%
%   PROBLEM ENVIRONMENT
%============================================================%

\box_new:N \l__braun_problem_box
\tl_new:N  \l__braun_solution_tl

\cs_set:Nn \braun_ghost_section: { \subsection*{} \skip_vertical:n {-3em} }

\cs_set:Nn \braun_begin_problem_box:
  { 
		\braun_ghost_section:
    \bool_if:NF \l_braun_problem_breakable_bool 
      {
          \vbox_set:Nw \l__braun_problem_box 
      }
  }

\cs_set:Nn \braun_end_problem_box:
  { 
    \bool_if:NF \l_braun_problem_breakable_bool 
      { 
        \vbox_set_end:
        \box_use_drop:N \l__braun_problem_box
      }
    \bool_if:NT \l_braun_problem_fill_bool 
      {
        \vfill
      }
  }

\newcounter { problem }

% #1 -> set keys: braun/problem
\NewDocumentEnvironment { problem } { O{} }
  {
    \BraunNoWarning
		\refstepcounter{ problem }

    \keys_set:nn { braun/problems } { id = , #1 }

    \dim_zero:N \parindent
    \dim_set_eq:NN \parskip \medskipamount
		\tl_set:Nn \arraystretch {1.5}
		
    \braun_begin_problem_box:

    %% HEADER
    \str_case:VnF \l_braun_problem_template_tl
      {
        { IME }
        {
          \skip_vertical:n {-10pt}
          \IMEproblemHeader
            [
              \bfseries
              \skip_horizontal:n {2em}
              Valor:\;
              \num 
                [ 
                  detect-all, 
                  drop-zero-decimal=false, 
                  round-mode=places, 
                  round-precision=2,
                ]
                { \fp_eval:n { \g_braun_problem_points_fp } }
              \skip_horizontal:n {2em}
            ]
            {
              \sffamily\bfseries
              \arabic { problem }
              \textsuperscript { a } 
              \text_uppercase:n { \l_braun_problem_name_tl }
            }
          }
          { pensi }
          {
            \PensiHeader
              { 
                \sffamily\bfseries
                \tl_use:N \l_braun_problem_name_tl
                \; \arabic { problem }
              }
          }
          { AFA }
          {
            \arabic { problem } \, - \, 
          } 
          { gabarito }
          {
            \PensiHeader
              { 
                \bfseries\large\sffamily
                \tl_use:N \l_braun_problem_name_tl
                \; \arabic { problem }
              }
          }       
      }
      {
        \textbf{ \l_braun_problem_name_tl \; \arabic { problem }. \; }   
      }
  } 
  {
    \bigskip
    \braun_end_problem_box:
    \skip_vertical:N \l_braun_problem_after_skip
  }

%============================================================%
%   SOLUÇÕES
%============================================================%

\tcbuselibrary { skins, breakable }

\tcbset { enhanced~ jigsaw }

\newcounter { step } [ problem ]

\cs_set:Npn \StepHeader #1
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
        {
          \strut 
          \bfseries
          \small
          \sffamily 
          Etapa~ \arabic{ step }. 
        }
        \; #1
      }
  }

\NewDocumentEnvironment { solution } { o }
    {
      \medskip
      \begin{tcolorbox}
        [
          breakable,
          title = \textbf{\sffamily\large Gabarito \IfValueT{#1}{: \; #1}},
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

      \dim_zero:N \parindent
      \dim_set_eq:NN \parskip \medskipamount
      
      \cs_set_eq:NN \paragraph \StepHeader

      \tl_set:Nn \arraystretch {1.5}
      \cs_set_eq:NN \toprule \relax

      \medskip
    } 
    {
      \medskip
      \end{tcolorbox}
      \bigskip
      \skip_vertical:n {3em}
    }

%============================================================%
%   TEXTO EM PROSA
%============================================================%

\RequirePackage { lineno }

\RenewDocumentEnvironment { quote } { +b }
	{
		\cs_set_eq:NN \subsubsection \minisec
		\begin{center}
    \parbox { 0.9 \textwidth }
      {
        \dim_set_eq:NN \parskip \bigskipamount
        \internallinenumbers
        #1
      }
	} 
	{
		\end{center}
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   TEMPLATES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_set:Npn \DeclareBraunTemplate #1 #2
  { \keys_define:nn { braun } { #1 .meta:n = { #2 } } }

%============================================================%
%   ITA
%============================================================%

\DeclareBraunTemplate { ITA }
  {
    DIV = 18,
    font = lmodern,
    fontsize = 11pt,
    emph = \itshape,
		page / section / template = ITA,
		% Título
    maketitle / print = { title, affiliation, date },
    maketitle / title / case = upper,
    maketitle / title / font = \Large\bfseries,
    maketitle / date / value = \int_use:N \c_sys_year_int,
    maketitle / date / font = \large\bfseries,
		maketitle / logo / value = ita-alt,
    maketitle / logo / value = pensi,
		% Problemas
    problems / name = Questão,
    problems / template = ITA,
  }

\DeclareBraunTemplate { ITAdis }
  {
    ITA,
		problems / breakable = false,
		problems / vfill = false,
  }

\DeclareBraunTemplate { ITAobj }
  {
    ITA,
		problems / breakable = false,
		problems / vfill = false,
  }

%============================================================%
%   IME
%============================================================%

\DeclareBraunTemplate { IME }
  {
    DIV = 16,
    font = helvetica,
    fontsize = 11pt,
    familydefault = sf,
    linewidth = 1.5pt,
    emph = \itshape,
    page / IME,
    % Título
    maketitle / align = c,
    maketitle / print = { title, affiliation, date },
    maketitle / toprule = false,
    maketitle / botrule = false,
    maketitle / title / case = upper,
    maketitle / title / font = \Large\bfseries,
    maketitle / date / value = \int_use:N \c_sys_year_int,
    maketitle / date / font = \large\bfseries,
    maketitle / logo / value = ime,
    maketitle / logo / value = pensi,
    % Problemas
    problems / name = Questão,
    problems / template = IME,
  }

\DeclareBraunTemplate { IMEdis }
  {
    IME,
    problems / breakable = false,
    problems / vfill = false,
  }

\DeclareBraunTemplate { IMEobj }
  {
    IME,
    problems / breakable = false,
    problems / vfill = false,
  }


%============================================================%
%   IME
%============================================================%

\DeclareBraunTemplate { AFA }
  {
    DIV = 22,
    twocolumn = true,
    font = helvetica,
    fontsize = 10pt,
    familydefault = sf,
    linewidth = 1.2pt,
    emph = \itshape,
    page / AFA,

    % Título
    maketitle / before-skip = 2.2em,
    maketitle / align = c,
    maketitle / print = { title, affiliation, date },
    maketitle / toprule = false,
    maketitle / botrule = true,
    maketitle / title / case = upper,
    maketitle / title / font = \Large\bfseries,
    maketitle / date / value = \int_use:N \c_sys_year_int,
    maketitle / date / font = \large\bfseries,
    maketitle / logo / value = afa,
    maketitle / logo / value = pensi,
    page / mcrule / black,
    % Problemas
    problems / name = Questão,
    problems / template = AFA,
    problems / breakable = true,
  }

%============================================================%
%   PENSI
%============================================================%

\DeclareBraunTemplate { pensi }
  {
    DIV = 18,
    font = firasans,
    fontsize = 11pt,
		headinclude = true,
		footinclude = true,
		linewidth = 1pt,
		% Cabeçalho e rodapé
		page / footer / pensi,
		page / header / pensi,
		page / section / template = gabarito,
		% Título
		maketitle / template = pensi,
		maketitle / pre-text = \thispagestyle { plain.scrheadings },
		% Problemas
		problems / name = Questão,
		problems / template = pensi,
		% Química
		chem / elements / display-style = ptable,
  }

\DeclareBraunTemplate { prova }
  {
    pensi,
		font = prova,
		fontsize = 12pt,
		% Problemas
    problems / skip-after = 4cm,
		% Química
		chem / elements / display-style = ptable,
  }

\DeclareBraunTemplate { gabarito }
  {
    pensi,
		% Problemas
		problems / breakable = true,
		problems / vfill = false,
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   PROCESSAMENTO DAS OPÇÕES
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProcessKeysOptions { braun }

\braun_select_font:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   LINGUAGEM
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { csquotes, babel }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   METADADOS DO PDF
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage { hyperref }

\exp_args:Nx \hypersetup
	{
		pdftitle    = Braun,
		pdfauthor   = Braun,
		pdfkeywords = {IME, ITA, Olimpíadas},
		pdfproducer = Braun,
		pdfcreator  = Braun,
	}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   MACROS ESPECÍFICAS PARA ALGUMAS PROVAS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\cs_set:Npn \EndPreamble
  {
		\group_begin:
		\str_case:VnF \l_braun_problem_template_tl
      {
				{ ITA }
        {
          \braun_horizontal_rule:
					\skip_vertical:n {3em}
        }       
      }
			{
				\bigskip
			}
		\group_end:
  } 

\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   CONFIGURAÇÕES DO TIKZ
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================%
%   GRÁFICOS
%============================================================%

\pgfqkeys {/pgf/number format}
  {
    set thousands separator = {},
    set decimal separator = {,\!},
  }

\pgfplotscreateplotcyclelist {braun plot cycle}
  {
    { blue   }, 
    { red    }, 
    { green  },
    { purple }, 
  }

\pgfplotscreateplotcyclelist {braun bar plot cycle}
  {
    { blue,   fill = blue!20   }, 
    { red,    fill = red!20    }, 
    { green,  fill = green!20  },
    { purple, fill = purple!20 }, 
  }

\pgfplotsset
  {
    compat = 1.18,
    samples = 150,
    legend cell align = left,
    cycle list name = braun plot cycle,
    bar cycle list/.style = { cycle list name = braun bar plot cycle },
    every axis plot/.append style = 
      {
        very thick,
        mark = none,
        mark options = 
          {
            fill = white,
          },
      },
  }

\tikzstyle { every pin } = [ draw = black ]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   MACROS
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%============================================================%
%   INSTRUÇÕES PARA PROVA
%============================================================%

\def \TestInstructions
	{
		\vspace{-3em}
		\begin{center}
			\def \arraystretch {2}
		  \begin{tabular}{ | p{0.7\textwidth} p{0.25\textwidth} | }
			\hline
				Nome: \hrulefill &
				Turma: \PrintAffiliation \\
				Unidade: Tijuca II \hspace{2.5cm}
				Professor: Gabriel Braun  &
				Data: \PrintDate \\
				\hline
				\textbf{Instruções:}
				\begin{itemize}[after-item-skip = 0pt]
					\item 
            Faça sua avaliação à caneta.
					\item 
            Resoluções a lápis não serão corrigidas.
					\item 
            Questões discursivas sem desenvolvimento não serão consideradas.
					\item 
            Não serão fornecidas folhas para rascunho.
				\end{itemize}
				& \multicolumn { 1 } { |l| } { \textbf{Nota:} }
				\\
				\hline
			\end{tabular}
		\end{center}
		\bigskip
	}

%============================================================%
%   PREÂMBULO DAS DISCIPLINAS
%============================================================%

%% Matemática
\def \matPreamble
  {
    \subsubsection*{Convenções}
    \begin{itemize}
      \item   
        Considere o sistema de coordenadas cartesiano, a menos que haja indicação contrária.
      \item 
        $\mathbb{N} = \{ 1, 2, 3, \ldots \}$ denota o conjunto dos números naturais.
      \item 
        $\mathbb{R}$ denota o conjunto dos números reais.
      \item 
        $\mathbb{C}$ denota o conjunto dos números complexos.
      \item 
        $i$ denota a unidade imaginária, $i^2 = -1$.
    \end{itemize}
  }

%% Física
\def \fisPreamble
  {
    \subsubsection*{Dados}
    \small
    \begin{itemize}
      \item 
        Aceleração local da gravidade, $g = \qty{10}{m.s^{-2}}$
      \item 
        Velocidade da luz no vácuo, $c = \qty{3e8}{m.s^{-1}}$
      \item 
        Velocidade do som, $v_\mathrm{som} = \qty{340}{m.s^{-1}}$
      \item 
        Carga elementar, $e = \qty{1,6e-19}{C}$
      \item 
        Constante de Planck, $h = \qty{6,6e-34}{m^2.kg.s^{-1}}$
    \end{itemize}

    \subsubsection*{Aproximações Numéricas}
    \small
    \begin{itemize}
      \item 
        $(1 + \alpha)^n \approx 1 + n \alpha$ para $|\alpha| \ll 1$
    \end{itemize}
  }

%% Química
\def \quiPreamble
  {
    \subsubsection*{Dados}
    \small
    \begin{itemize}
      \item 
        Constante de Avogadro, $N_\mathrm{A} = \qty{6,02e23}{mol^{-1}}$
      \item 
        Constante de Faraday, $F = \qty{96500}{C.mol^{-1}}$
      \item 
        Carga elementar, $e = \qty{1,6e-19}{C}$
      \item 
        Constante dos gases, $R = \qty{8,31}{J.K^{-1}.mol^{-1}}$
      \item 
        Constante de Planck, $h = \qty{6,6e-34}{m^2.kg.s^{-1}}$
      \item 
        Constante de Rydberg, $\mathcal{R} = \qty{1,1e7}{m^{-1}}$
      \item 
        Constante de autoionização da água, $K_\mathrm{w} = \num{1e-14}$
      \item 
        Velocidade da luz no vácuo, $c = \qty{3e8}{m.s^{-1}}$
    \end{itemize}

    \subsubsection*{Definições}
    \small
    \begin{itemize}
      \item 
        Composição do ar atmosférico: $79\%\; \ce{N2}$ e $21\%\; \ce{O2}$
    \end{itemize}

    \subsubsection*{Aproximações Numéricas}
    \small
    \begin{itemize}
      \item 
        $\sqrt{2} = \num{1,4}$
      \item 
        $\sqrt{3} = \num{1,7}$
      \item 
        $\sqrt{5} = \num{2,2}$
      \item 
        $\log 2 = \num{0,3}$
      \item 
        $\log 3 = \num{0,5}$
      \item 
        $\ln 10 = \num{2,3}$
    \end{itemize}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                              
%   THE END!!!
%                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\recalctypearea
