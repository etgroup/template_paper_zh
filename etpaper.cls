% --- Class structure: identification part
\ProvidesClass{etpaper}[2020/04/12 v0.09 ETLaTeX Paper class]
\NeedsTeXFormat{LaTeX2e} 

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=ET, prefix=ET@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ET}{#1}}

\DeclareStringOption[en]{lang}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{en}{\ekv{lang=en}}

\DeclareStringOption[cm]{math}

\DeclareStringOption[numbers]{cite}
\DeclareVoidOption{numbers}{\ekv{cite=numbers}}
\DeclareVoidOption{authoryear}{\ekv{cite=authoryear}}
\DeclareVoidOption{super}{\ekv{cite=super}}

\DeclareStringOption[apalike]{bibstyle}

\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{macos}{\ekv{chinesefont=macos}}
\DeclareVoidOption{win10}{\ekv{chinesefont=win10}}

\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareVoidOption{newtx}{\ekv{math=newtx}}
\DeclareVoidOption{mtpro2}{\ekv{math=mtpro2}}
\DeclareVoidOption{cm}{\ekv{math=cm}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=true,
  linkcolor={winered},
  urlcolor={winered},
  filecolor={winered},
  citecolor={winered},
  linktoc=all,
}
% settings for the hyperref and geometry
\RequirePackage[
  left=1in,
  right=1in,
  top=1in,
  bottom=1in,
  headheight=0pt,
  headsep=0pt]{geometry}
\setlength{\headsep}{5pt}

\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
% \RequirePackage{linegoal}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{abstract}
\RequirePackage{hologo}

\linespread{1.35}
\graphicspath{{image/}{figure/}{fig/}{img/}}

% caption settings 
\RequirePackage[font=small,labelfont={bf}]{caption}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}


% define the hyperref color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}

\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}


% add the email cmd 
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% font settings

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage{iftex}
\ifdefstring{\ET@lang}{cn}{
  \ifXeTeX
    \ifdefstring{\ET@chinesefont}{founder}{
      \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
      \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
      \setCJKsansfont[BoldFont={FZHei-B01},ItalicFont={FZHei-B01}]{FZHei-B01}
      \setCJKmonofont[BoldFont={FZHei-B01},ItalicFont={FZHei-B01}]{FZFangSong-Z02}
      \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
      \setCJKfamilyfont{zhhei}{FZHei-B01}
      \setCJKfamilyfont{zhkai}{FZKai-Z03}
      \setCJKfamilyfont{zhfs}{FZFangSong-Z02}
      \newcommand*{\songti}{\CJKfamily{zhsong}}
      \newcommand*{\heiti}{\CJKfamily{zhhei}}
      \newcommand*{\kaishu}{\CJKfamily{zhkai}}
      \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}
    

    \ifdefstring{\ET@chinesefont}{macos}{
      \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
      \setCJKmainfont[BoldFont={STHeitiSC-Light},ItalicFont={STKaitiSC-Regular}]{STSongti-SC-Regular}
      \setCJKsansfont[BoldFont={SIL-Hei-Med-Jian},ItalicFont={SIL-Hei-Med-Jian}]{SIL-Hei-Med-Jian}
      \setCJKmonofont[BoldFont={SIL-Hei-Med-Jian},ItalicFont={SIL-Hei-Med-Jian}]{STFangsong}
      \setCJKfamilyfont{zhsong}{STSongti-SC-Regular}
      \setCJKfamilyfont{zhhei}{SIL-Hei-Med-Jian}
      \setCJKfamilyfont{zhkai}{STKaitiSC-Regular}
      \setCJKfamilyfont{zhfs}{STFangsong}
      \newcommand*{\songti}{\CJKfamily{zhsong}}
      \newcommand*{\heiti}{\CJKfamily{zhhei}}
      \newcommand*{\kaishu}{\CJKfamily{zhkai}}
      \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}

    \ifdefstring{\ET@chinesefont}{win10}{
      \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
      \setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
      \setCJKsansfont[BoldFont={Microsoft YaHei-Regular},ItalicFont={Microsoft YaHei-Regular}]{Microsoft YaHei-Regular}
      \setCJKmonofont[BoldFont={Microsoft YaHei-Regular},ItalicFont={Microsoft YaHei-Regular}]{FangSong}
      \setCJKfamilyfont{zhsong}{SimSun}
      \setCJKfamilyfont{zhhei}{Microsoft YaHei-Regular}
      \setCJKfamilyfont{zhkai}{KaiTi}
      \setCJKfamilyfont{zhfs}{FangSong}
      \newcommand*{\songti}{\CJKfamily{zhsong}}
      \newcommand*{\heiti}{\CJKfamily{zhhei}}
      \newcommand*{\kaishu}{\CJKfamily{zhkai}}
      \newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}      

    \ifdefstring{\ET@chinesefont}{nofont}{
      \RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}}{\relax}

    \ifdefstring{\ET@chinesefont}{ctexfont}{
      \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
  \else
    \ifdefstring{\ET@chinesefont}{ctexfont}{
      \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
  \fi
  \AfterEndPreamble{
    % \renewcommand{\itshape}{\kaishu}
    \setlength\parindent{2\ccwd}}}{\relax}

\ifcsname kaishu\endcsname
  \newcommand{\citshape}{\kaishu}
\else
  \newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
  \newcommand{\cnormal}{\kaishu}
\else
  \newcommand{\cnormal}{\normalfont}
\fi

\ifcsname fangsong\endcsname
  \newcommand{\cfs}{\fangsong}
\else
  \newcommand{\cfs}{\normalfont}
\fi

\RequirePackage{newtxtext}
\ifdefstring{\ET@math}{newtx}{
  \RequirePackage{newtxmath}
  \let\Bbbk\relax
  \RequirePackage{esint}
  %%% use yhmath pkg, uncomment following code
  % \let\oldwidering\widering
  % \let\widering\undefined
  % \RequirePackage{yhmath}
  % \let\widering\oldwidering

  %%% use esvect pkg, uncomment following code
  % \RequirePackage{esvect}

  \DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
  \let\sumop\relax\let\prodop\relax
  \DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
  \DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}
}{\relax}

\RequirePackage{appendix}

\ifdefstring{\ET@lang}{cn}{
  \theoremstyle{plain}% default
  \newtheorem{theorem}{定理}[section] %
  \newtheorem{lemma}[theorem]{引理} %
  \newtheorem{proposition}[theorem]{命题} %
  \newtheorem*{corollary}{推论} %
  \theoremstyle{definition} %
  \newtheorem{definition}{定义}[section] %
  \newtheorem{conjecture}{猜想}[section] %
  \newtheorem{example}{例}[section] %
  \theoremstyle{remark} %
  \newtheorem*{remark}{\normalfont\bfseries 评论} %
  \newtheorem*{note}{\normalfont\bfseries 注} %
  \newtheorem{case}{\normalfont\bfseries 案例} %
  \renewcommand*{\proofname}{\normalfont\bfseries 证明} %
  \renewcommand\contentsname{目录}
  \renewcommand\refname{参考文献} %
  \renewcommand\figurename{图} %
  \renewcommand\tablename{表}%
  \newcommand\versiontext{版本：}%
  \newcommand\updatetext{日期：}%
  \renewcommand\abstractname{摘\hspace{2em}要}
  \setlength\parindent{2\ccwd}
  \renewcommand{\abstracttextfont}{\small\citshape\noindent\ignorespaces}
  % 新定义命令
  \newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
  \newcommand\figref[1]{{\bfseries 图~\ref{#1}}}
  \newcommand\tabref[1]{{\bfseries 表~\ref{#1}}}
  \RequirePackage{gbt7714}
  \ifdefstring{\ET@cite}{authoryear}{
    \bibliographystyle{gbt7714-author-year}}{
    \bibliographystyle{gbt7714-numerical}}
  \ifdefstring{\ET@cite}{numbers}{
    \citestyle{numbers}}{\relax}
  \renewcommand{\appendixtocname}{附录}
  \renewcommand{\appendixpagename}{附录}}{\relax}

\ifdefstring{\ET@lang}{en}{
  \theoremstyle{plain}% default
  \newtheorem{theorem}{Theorem}[section] %
  \newtheorem{lemma}[theorem]{Lemma} %
  \newtheorem{proposition}[theorem]{Proposition} %
  \newtheorem*{corollary}{Corollary} %
  \theoremstyle{definition} %
  \newtheorem{definition}{Definition}[section] %
  \newtheorem{conjecture}{Conjecture}[section] %
  \newtheorem{example}{Example}[section] %
  \theoremstyle{remark} %
  \newtheorem*{remark}{Remark} %
  \newtheorem*{note}{Note} %
  \newtheorem{case}{Case} %
  \renewcommand*{\proofname}{\normalfont\bfseries Proof}%
  \newcommand\versiontext{\itshape Version: }%
  \newcommand\updatetext{\itshape Date: }%
  \setlength\parindent{2em}
  \renewcommand{\abstracttextfont}{\sffamily\small\noindent\ignorespaces}
  % newcommands defined in this template.
  \newcommand{\keywords}[1]{\vskip 2ex\par\noindent\normalfont{\bfseries Keywords: } #1}
  \newcommand\figref[1]{{\bfseries Figure~\ref{#1}}}
  \newcommand\tabref[1]{{\bfseries Table~\ref{#1}}}
  \RequirePackage[\ET@cite,sort&compress]{natbib}
  \bibliographystyle{\ET@bibstyle}}{\relax}

\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}

\AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}
\BeforeBeginEnvironment{tabular}{\small}
\AfterEndEnvironment{tabular}{}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \RequirePackage[flushmargin]{footmisc}
  \setlength{\footnotesep}{12pt}}

\def\IfEmpty#1{%
  \edef\1{\the#1}
  \ifx\1\empty
}
\newtoks\version
\newtoks\institute

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@0.1em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@ET@version\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\ET@version\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\[1ex]
      \end{tabular}\par}
      \the\institute%
\vskip 0.5ex%
\IfEmpty\version
\else 
{\small\normalfont\citshape\versiontext\the\version}
\fi
\ifx\@date\empty
\else
\vskip 0.1em%
 {\small\normalfont\citshape\updatetext\@date}%
\fi
  \end{center}%
  \par
}
  

\RequirePackage{listings}
\renewcommand{\ttdefault}{cmtt}

\lstdefinestyle{estyle}{
  basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\footnotesize\fi
}
\lstset{basicstyle=\scriptsize\ttfamily,style=estyle}

\lstset{language=[LaTeX]TeX,
	texcsstyle=*\color{winered},
	numbers=none,
	breaklines=true,
	keywordstyle=\color{winered},
	frame=tlbr,framesep=4pt,framerule=0pt,
	commentstyle=\color{commentcolor},
	emph={etpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,cite,gbt7714,lang},
	emphstyle={\color{frenchplum}},
	morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,zhdate,zhtoday},
	tabsize=2,
	backgroundcolor=\color{lightgrey}
}





