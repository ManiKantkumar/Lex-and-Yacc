%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"(" {return A;}
")" {return B;}
[\n] {return NL;}
. {return ANY;}
%%
int yywrap()
{
	return 1;
}
