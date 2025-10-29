% Plantilla creada por Francisco Javier Vázquez Tavares
% Esta platilla se creo para facilitar la creación de documentos para tareas.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{professorClass}                % Mismo nombr que el .cls
\LoadClass[12pt]{report} % Por si quieres iniciar desde algo que ya existe

%------------PAQUETES------------%

\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}             % Permite acentos y carcatérres especiales
\RequirePackage{csquotes,xpatch}
\RequirePackage[T1]{fontenc}
\RequirePackage[
  inner	=	2.5cm, % Margen interior
  outer	=	2.5cm, % Margen exterior
  top	=	1.5cm, % Margen superior
  bottom=	1.5cm, % Margen inferior
  includeheadfoot, % Incluye cabecera y pie de página en los márgenes
]{geometry}
%\RequirePackage{showframe}

% Estética y formateo del texto
\RequirePackage{ragged2e}
\RequirePackage{fancyhdr}
\RequirePackage[hidelinks]{hyperref} 		% Referencias dinámicas
\RequirePackage{lmodern}
\RequirePackage{fancyhdr} 		% Encabezados y pies de páginas
\RequirePackage{comment}
\RequirePackage{changepage} 	% Permite modificar tamaño de pagina
\RequirePackage{url}			% Hyperlinks
\RequirePackage{fancybox}		% Recuadros
\RequirePackage[inline]{enumitem} % Cambiar la enumeración de enumerate
\RequirePackage{listings}       % Modificación para códigos
\RequirePackage[backend=biber,style=science]{biblatex}           % Bibliografía
\addbibresource{bibliografia.bib}
\AtBeginBibliography{\normalsize}
\RequirePackage[many]{tcolorbox}

% https://www.overleaf.com/learn/latex/Biblatex_bibliography_styles

% Paquetes de notación matemática y física
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,amscd,latexsym}
\RequirePackage{physics}
\RequirePackage{siunitx} 		% Permite utilizar el sistema internacional de unidades
\RequirePackage{mathptmx}
\RequirePackage{mathtools}
\RequirePackage{cancel}
\RequirePackage{centernot} 		% Notacion matematica
\RequirePackage{empheq}			% Recuadros para ecuaciones

% Recursos Visuales
\RequirePackage{graphics} 		% for pdf, bitmapped graphics files
\RequirePackage{graphicx} 		% Insertar imágenes
\RequirePackage{caption} 		% Figure
\RequirePackage{subcaption} 	% Subfigure
\RequirePackage{float}          % Alineación de la figura
\RequirePackage{rotating} 		% Rotar imagenes
\RequirePackage{tikz}   		% To create graphics in LaTeX
\RequirePackage{multicol} 		% Formato doble columna
\RequirePackage{multirow} 		% Multi row is for tables with multiple rows within one cell.
\RequirePackage{booktabs} 		% For even nicer tables.

%------------COMANDOS Y AMBIENTES------------%

\makeatletter     
\newcommand\materia[1]{\renewcommand\@materia{\textbf{#1}}}
\newcommand\@materia{\@latex@error{No \noexpand\materia given}\@ehc}

\newcommand\profe[1]{\renewcommand\@profe{#1\\}}
\newcommand\@profe{\@latex@error{No \noexpand\profe given}\@ehc}

% Redefinition of ToC command to get centered heading
\renewcommand\tableofcontents{%
  \null\textbf{\normalsize\contentsname}\null\par
  \@mkboth{\MakeUppercase\contentsname\small}{\MakeUppercase\contentsname\small}%
  \@starttoc{toc}%
}
       
\renewcommand\maketitle{
    {   
        \begin{center}
            
            \begin{minipage}[c]{\textwidth}
                {\Large\bfseries\@title}\hfill{\@profe}
            \end{minipage}
        \end{center}
        \vspace{-1.5em}
        {\large Name:\hspace{0.25em}}\makebox[0.6\textwidth]{\rule{0.6\textwidth}{0.4pt}}
        \vspace{-1em}
    }
} % Note the extra }
\makeatother

\newtcbtheorem[]{definition}{Definition}%
    {enhanced,
    colback = black!5, %white,
    colbacktitle = black!5,
    coltitle = black,
    boxrule = 0pt,
    frame hidden,
    borderline west = {0.5mm}{0.0mm}{black},
    fonttitle = \bfseries\sffamily,
    breakable,
    before skip = 3ex,
    after skip = 3ex
}{problem}

\newtcbtheorem[]{example}{Example}%
    {enhanced,
    colback = black!5, %white,
    colbacktitle = black!5,
    coltitle = black,
    boxrule = 0pt,
    frame hidden,
    borderline west = {0.5mm}{0.0mm}{black},
    fonttitle = \bfseries\sffamily,
    breakable,
    before skip = 3ex,
    after skip = 3ex
}{problem}



\tcbuselibrary{skins, breakable}



% Subtract 1 from counters that are used
\renewcommand\thesection{\arabic{section}}
\setcounter{secnumdepth}{3}

\setlength{\marginparwidth}{0mm}
\setlength{\parskip}{1em}

%------------OTRAS COSAS------------%

\pagestyle{fancy}            % Header style.


\RequirePackage{subfiles}
