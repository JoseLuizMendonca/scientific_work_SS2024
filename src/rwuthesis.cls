\NeedsTeXFormat{LaTeX2e}[2017/01/01]
\ProvidesClass{rwuthesis}[2019/09/02 RWU thesis class]

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{translations}

\SetupKeyvalOptions{
	family=rwuthesis,
	prefix=rwuthesis@
}

\newcommand{\rwuthesis@baseclass}{scrreprt}

\DeclareVoidOption{twoside}{%
	\PassOptionsToClass{\CurrentOption}{\rwuthesis@baseclass}
}
\DeclareVoidOption{twocolumn}{%
	\PassOptionsToClass{\CurrentOption}{\rwuthesis@baseclass}
}

\DeclareStringOption{type}
\DeclareStringOption{DIV}
\DeclareStringOption{BCOR}

\ProcessKeyvalOptions*

\PassOptionsToClass{12pt}{\rwuthesis@baseclass}

\LoadClass[listof=nochaptergap]{scrreprt}
\RequirePackage{rwukoma}

\ifthenelse{\equal{\rwuthesis@DIV}{}}{}{%
	\KOMAoption{DIV}{\rwuthesis@DIV}%
}

\ifthenelse{\equal{\rwuthesis@BCOR}{}}{}{%
	\KOMAoption{BCOR}{\rwuthesis@BCOR}%
}

\ifthenelse{\equal{\rwuthesis@type}{bachelor} \OR \equal{\rwuthesis@type}{master} \OR \equal{\rwuthesis@type}{report}}{%
	\ClassInfo{rwuthesis}{Thesis type is \rwuthesis@type}%
}{%
	\ClassError{rwuthesis}{Thesis type has to be bachelor, master, or report}{%
		Please specify the type option as type=bachelor, type=master, or type=report\MessageBreak
		when defining the document class, e.g.:\MessageBreak
		\space\space \protect\documentclass[type=bachelor]{rwuthesis}
	}%
}

\DeclareTranslationFallback{rwuthesis-bachelor-thesis}{Bachlor Thesis}
\DeclareTranslation{English}{rwuthesis-bachelor-thesis}{Bachelor Thesis}
\DeclareTranslation{German}{rwuthesis-bachelor-thesis}{Bachelor-Thesis}

\DeclareTranslationFallback{rwuthesis-master-thesis}{Master Thesis}
\DeclareTranslation{English}{rwuthesis-master-thesis}{Master Thesis}
\DeclareTranslation{German}{rwuthesis-master-thesis}{Master-Thesis}

\DeclareTranslationFallback{rwuthesis-degree-course}{Degree Course}
\DeclareTranslation{English}{rwuthesis-degree-course}{Degree Course}
\DeclareTranslation{German}{rwuthesis-degree-course}{Studiengang}

\DeclareTranslationFallback{rwuthesis-faculty}{Faculty of}
\DeclareTranslation{English}{rwuthesis-faculty}{Faculty of}
\DeclareTranslation{German}{rwuthesis-faculty}{Fakultät}

\DeclareTranslationFallback{rwuthesis-first-reviewer}{First Reviewer}
\DeclareTranslation{English}{rwuthesis-first-reviewer}{First Reviewer}
\DeclareTranslation{German}{rwuthesis-first-reviewer}{Erster Gutachter}
\DeclareTranslationFallback{rwuthesis-second-reviewer}{Second Reviewer}
\DeclareTranslation{English}{rwuthesis-second-reviewer}{Second Reviewer}
\DeclareTranslation{German}{rwuthesis-second-reviewer}{Zweiter Gutachter}

\DeclareTranslationFallback{rwuthesis-to-attain}{to attain the academic degree}
\DeclareTranslation{English}{rwuthesis-to-attain}{to attain the academic degree}
\DeclareTranslation{German}{rwuthesis-to-attain}{zur Erlangung des akademischen Grades}

\DeclareTranslationFallback{rwuthesis-submitted-by}{submitted by}
\DeclareTranslation{English}{rwuthesis-submitted-by}{submitted by}
\DeclareTranslation{German}{rwuthesis-submitted-by}{vorgelegt von}

\DeclareTranslationFallback{matriculation-number}{Matriculation number}
\DeclareTranslation{English}{matriculation-number}{Matriculation number}
\DeclareTranslation{German}{matriculation-number}{Matrikelnummer}

% Add the translation for the report type
\DeclareTranslationFallback{rwuthesis-report}{Scientific Work}
\DeclareTranslation{English}{rwuthesis-report}{Scientific Work}
\DeclareTranslation{German}{rwuthesis-report}{Wissenschaftliche Arbeit}

% Add the translation for the supervisor
\DeclareTranslationFallback{rwuthesis-supervisor}{Supervising Professor}
\DeclareTranslation{English}{rwuthesis-supervisor}{Supervising Professor}
\DeclareTranslation{German}{rwuthesis-supervisor}{Betreuender Professor}

\newcommand{\authormail}[1]{\newcommand{\rwuthesis@authormail}{#1}}
\newcommand{\fordegree}[1]{\newcommand{\rwuthesis@fordegree}{#1}}
\newcommand{\firstreviewer}[1]{\newcommand{\rwuthesis@firstreviewer}{#1}}
\newcommand{\firstreviewermail}[1]{\newcommand{\rwuthesis@firstreviewermail}{#1}}
\newcommand{\secondreviewer}[1]{\newcommand{\rwuthesis@secondreviewer}{#1}}
\newcommand{\secondreviewermail}[1]{\newcommand{\rwuthesis@secondreviewermail}{#1}}
\newcommand{\degreecourse}[1]{\newcommand{\rwuthesis@degreecourse}{#1}}
\newcommand{\faculty}[1]{\newcommand{\rwuthesis@faculty}{#1}}
\newcommand{\matnumber}[1]{\newcommand{\rwuthesis@matnumber}{#1}}

% New command for adding second author
\newcommand{\secondauthor}[1]{\newcommand{\rwuthesis@secondauthor}{#1}}
\newcommand{\secondauthormail}[1]{\newcommand{\rwuthesis@secondauthormail}{#1}}
\newcommand{\secondmatnumber}[1]{\newcommand{\rwuthesis@secondmatnumber}{#1}}

% New command for adding supervisor
\newcommand{\supervisor}[1]{\newcommand{\rwuthesis@supervisor}{#1}}
\newcommand{\supervisormail}[1]{\newcommand{\rwuthesis@supervisormail}{#1}}

\renewcommand{\maketitle}{%
	\begin{titlepage}
		\sffamily
		\begingroup%
			\setlength{\parfillskip}{0pt}%
			\begin{minipage}{\dimexpr\textwidth-6.12cm\relax}%
				\GetTranslation{rwuthesis-degree-course} \rwuthesis@degreecourse\\
				\GetTranslation{rwuthesis-faculty} \rwuthesis@faculty%
			\end{minipage}\hfill\begin{minipage}{5.12cm}%
				\rwulogo%
			\end{minipage}%
			\par%
		\endgroup

		\vfill
		\ifthenelse{\equal{\rwuthesis@type}{bachelor}}{%
			\textbf{\LARGE\GetTranslation{rwuthesis-bachelor-thesis}}
		}{%
			\ifthenelse{\equal{\rwuthesis@type}{report}}{%
				\textbf{\LARGE\GetTranslation{rwuthesis-report}}
			}{%
				\textbf{\LARGE\GetTranslation{rwuthesis-master-thesis}}
			}
		}

		\textbf{\Large\@title}

		\vfill

		%\GetTranslation{rwuthesis-to-attain}\\
		%\rwuthesis@fordegree

		\vfill

		\GetTranslation{rwuthesis-submitted-by}:

		\textbf{\Large\@author}
		\ifthenelse{\isundefined{\rwuthesis@authormail}}{%
			\ClassWarning{rwuthesis}{\protect\authormail\space undefined, no mail address on title page}
		}{%
			\\
          \ifthenelse{\isundefined{\rwuthesis@matnumber}}{%
          }{
          \GetTranslation{matriculation-number}: \rwuthesis@matnumber\\
          }
			<\url{\rwuthesis@authormail}>
		}

		\vfill

		% add second author
		\textbf{\Large\rwuthesis@secondauthor}
		\ifthenelse{\isundefined{\rwuthesis@secondauthormail}}{%
			\ClassWarning{rwuthesis}{\protect\secondauthormail\space undefined, no mail address on title page}
		}{%
			\\
          \ifthenelse{\isundefined{\rwuthesis@secondmatnumber}}{%
          }{
          \GetTranslation{matriculation-number}: \rwuthesis@secondmatnumber\\
          }
			<\url{\rwuthesis@secondauthormail}>
		}

		\vfill
	
	

		\@date

		\vfill


		% Check if it is a report or a thesis
		\begin{tabular}{@{ }ll}
			\ifthenelse{\isundefined{\rwuthesis@firstreviewer}}{}{
				\GetTranslation{rwuthesis-first-reviewer}: & \rwuthesis@firstreviewer
			}
			\ifthenelse{\isundefined{\rwuthesis@firstreviewermail}}{}{
				<\url{\rwuthesis@firstreviewermail}>%
				
			}
			\\
			\ifthenelse{\isundefined{\rwuthesis@secondreviewer}}{}{
				\GetTranslation{rwuthesis-second-reviewer}: & \rwuthesis@secondreviewer
			}
			\ifthenelse{\isundefined{\rwuthesis@secondreviewermail}}{}{
				<\url{\rwuthesis@secondreviewermail}>%
				%\vfill
			}
			%% add supervisor
			\\
			\ifthenelse{\isundefined{\rwuthesis@supervisor}}{}{
				\GetTranslation{rwuthesis-supervisor}: & \rwuthesis@supervisor
			}
			\ifthenelse{\isundefined{\rwuthesis@supervisormail}}{}{
				<\url{\rwuthesis@supervisormail}>%
				%\vfill
			}
		\end{tabular}
	\end{titlepage}
	\cleardoublepage
}

\endinput
