%{
#include<stdio.h>
int flag=0;
int yyerror();
int yylex();
%}
%name parse
%token A B C ANY NL
%%
str1 : str2 NL {flag++; return 1;}|ANY {};
str2 : str3 str4 {};
str3 : A str3 B {};|{} {};
str4 : B str4 C {};|{} {};
%%
int yyerror()
{
	printf("Error ");
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
