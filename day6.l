%{
#include "y.tab.h"
%}
%%
"1"	{return A;}
"0"	{return B;}
[\n]	{return NL;}
.	{return ANY;}
%%
int yywrap(){
	return 1;
}
