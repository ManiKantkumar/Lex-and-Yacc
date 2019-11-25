%{
#include "y.tab.h"
extern char ch;
%}
%%
"+"	{return A;}
"-"	{return S;}
"*"	{return M;}
"/"	{return D;}
[0-9a-zA-Z] {ch=*yytext;return ID;};
[\n]	{return NL;}
.	{return ANY;}
%%
int yywrap()
{
	return 1;
}

