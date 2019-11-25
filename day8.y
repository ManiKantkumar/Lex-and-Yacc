%{
#include <stdio.h>
int flag=0;
int yylex();
int yyerror();
%}
%name parse
%token A B NL ANY
%%
str1 : str2 NL {flag++;return 1;} | ANY {};
str2 : str2 A str2 B {}; | {} {};
%%
int yyerror(){
	printf("Error \n");
}
int main()
{
	yyparse();
	if(flag)
		printf("Accept");
	else
		printf("Reject");
	return 0;
}
