%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{resume}[2015/12/14 v1.3 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
% \setlength: change the values of the variables defining the page layout
% \overfullrule:
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\ifxetex
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
\else
\RequirePackage[T1]{fontenc}
% Replace by the encoding you are using
\RequirePackage[utf8]{inputenc}
\fi
% Needed to manage math fonts
%\RequirePackage[math-style=TeX]{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage{hyperref}
\hypersetup{
	pdftitle={},
	pdfauthor={},
	pdfsubject={},
	pdfkeywords={},
	colorlinks=false,
	allbordercolors=white
}
% Needed to draw skills circle
\RequirePackage{tikz}

%\RequirePackage{xparse}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and offset
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-midnight-blue}{HTML}{191970}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}

\colorlet{awesome}{awesome-midnight-blue}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
Path=\@fontdir,
UprightFont=*-Regular,
ItalicFont=*-Italic,
BoldFont=*-Bold,
BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
Path=\@fontdir,
UprightFont=*-Thin,
ItalicFont=*-ThinItalic,
BoldFont=*-Medium,
BoldItalicFont=*-MediumItalic,
]{Roboto}

% Set font for footer (default is Source Sans Pro)
\newfontfamily\footerfont[
Path=\@fontdir,
UprightFont=*-Regular,
ItalicFont=*-It,
BoldFont=*-Bold
]{SourceSansPro}

% Set font for body (default is Source Sans Pro)
\newfontfamily\bodyfont[
Path=\@fontdir,
UprightFont=*-Regular,
ItalicFont=*-It,
BoldFont=*-Bold,
BoldItalicFont=*-BoldIt
]{SourceSansPro}

\newfontfamily\bodyfontlight[
Path=\@fontdir,
UprightFont=*-Light,
ItalicFont=*-LightIt,
BoldFont=*-Semibold,
BoldItalicFont=*-SemiboldIt
]{SourceSansPro}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
\newcommand{\firstnamestyle}[1]{{\fontsize{30pt}{1em}\headerfontlight #1}}
\newcommand{\lastnamestyle}[1]{{\fontsize{30pt}{1em}\headerfontlight #1}}
\newcommand{\addressstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}
\newcommand{\emailstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}
\newcommand{\telephonestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{awesome} #1}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{graytext} #1}}
%
\newcommand*{\descriptionstyle}[1]{{
	 \setstretch{1.0}
	 \fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1
	 \par
}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}

% For languages
% Circle for skills
\newcommand*{\languagestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\bfseries\color{text} #1}}
\newcommand{\fullgraycircle}{\tikz\draw[gray,fill=gray] (0,0) circle (.4ex);}
\newcommand{\fullcircle}{\tikz\draw[awesome,fill=awesome] (0,0) circle (.5ex);\enskip}
\newcommand{\emptycircle}{\tikz\draw[awesome,fill=white] (0,0) circle (.5ex);\enskip}
\newcommand{\statcirc}[2]{%
	\begin{tikzpicture}
	\fill[#1] (0,0) circle (0.6ex);
	\fill[#2] (0,0) -- (90:0.4ex) arc (90:-90:0.4ex) -- cycle;
	\end{tikzpicture}
}
\newcommand{\halfcircle}{\statcirc{awesome}{white}}

\newcommand{\zerooverfive}{\emptycircle \emptycircle \emptycircle \emptycircle \emptycircle}
\newcommand{\oneoverfive}{\fullcircle \emptycircle \emptycircle \emptycircle \emptycircle}
\newcommand{\twooverfive}{\fullcircle \fullcircle \emptycircle \emptycircle \emptycircle}
\newcommand{\threeoverfive}{\fullcircle \fullcircle \fullcircle \emptycircle \emptycircle}
\newcommand{\fouroverfive}{\fullcircle \fullcircle \fullcircle \fullcircle \emptycircle}
\newcommand{\fourandahalfoverfive}{\fullcircle \fullcircle \fullcircle \fullcircle \halfcircle}
\newcommand{\fiveoverfive}{\fullcircle \fullcircle \fullcircle \fullcircle \fullcircle}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific tickness
% \leavevmode : ensure that vertical mode is ended
\renewcommand{\hrulefill}[1]{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


\newcommand{\header}[7]{
	\begin{center}
		\firstnamestyle{#1} \lastnamestyle{#2} \\
		\vspace{0.4cm}
		\addressstyle{#3} \\
		\emailstyle{#4}~~\fullgraycircle~~\telephonestyle{#5}~~\fullgraycircle~~\href{https://www.linkedin.com/in/mederic-fourmy-738aa3110/}{\faLinkedinSquare}  \\
	\end{center}
	\ifempty{#6#7}
	{}
	{
		\vspace{0.2cm}
		\entrytitlestyle{\underline{\textbf{#6}:} #7}
	}
	
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{

	\vspace{0.2cm}
	\sectionstyle{#1}
	\hrulefill{0.2pt}

	\vspace{-0.1cm}
}

% Define an environment for cventry
\newenvironment{cventries}{
	\begin{center}
	}{
	\end{center}
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	% deal with the space between rows
	\renewcommand{\arraystretch}{0.7}
	%\begin{tabular*}{width}[pos]{cols}
	%column 1 entry &column 2 entry ... &column n entry \\
	%...
	%\end{tabular*}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{12.5cm} R{4.5cm}}
		\ifempty{#2#3}
		{\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
		{\entrytitlestyle{#1} & \entrylocationstyle{#3} \\
			\entrypositionstyle{#2} & \entrydatestyle{#4} \\}
		% description
		\multicolumn{2}{L{17cm}}{\descriptionstyle{#5}} \\
	\end{tabular*}
	% back to normal
	\renewcommand{\arraystretch}{1}

	% !!! Necessary to end the paragraph by inserting an empty line so that the vspace work
	% a commentary does not count as an empty line
	\ifempty{#5}{
		\vspace{-1cm}
	}{
		\vspace{-0.6cm}
	}
}

% Define an environment for cvitems(for )
\newenvironment{cvitems}[1]{
	% used if the items are preceded by a short description
	\ifempty{#1}{\vspace{-4mm}}{}
	\begin{justify}
		\begin{itemize}[leftmargin=3ex, nosep, noitemsep]
			\setlength{\parskip}{0pt}
			\renewcommand{\labelitemi}{$\bullet$}  % $$ needed HERE !
		}{
		\end{itemize}
	\end{justify}
}

% Define an environment for cvskill
\newenvironment{cvskills}{
	\vspace{0.2cm}
	\begin{center}
		\setlength\tabcolsep{1ex}
		\setlength{\extrarowheight}{0pt}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{15.2cm}}
		}{
		\end{tabular*}
	\end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{
	\skilltypestyle{#1} & \skillsetstyle{#2}
	\\
}

% Define a small-circle language skills line
% Up to four languages can be defined
% Usage: {<firstlanguage>}{<firstlevel>}{<secondlanguage>}{<secondlevel>}...
\newcommand*{\cvlanguages}[8]{
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	\begin{tabular*}{\textwidth}[t]{@{\extracolsep{\fill}} L{0.25\textwidth} C{0.25\textwidth} C{0.25\textwidth} R{0.25\textwidth}}
		 \descriptionstyle{\textbf{#1} \enskip #2}
		 & \descriptionstyle{\textbf{#3} \enskip #4}
		 &\descriptionstyle{\textbf{#5} \enskip #6}
		 & \descriptionstyle{\textbf{#7} \enskip #8}
	\end{tabular*}

	\vspace{-0.5cm}
}
