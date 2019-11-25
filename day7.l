%{
#include "y.tab.h"
%}
%%
"a"	{return A;}
"b"	{return B;}
"c"	{return C;}
[\n]	{return NL;}
.	{return ANY;}
%%
int yywrap()
{
	return 1;
}

