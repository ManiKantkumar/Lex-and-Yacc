%{
#include<stdio.h>
int flag=0;
int yyerror();
int yylex();
%}
%name parse
%token A B ANY NL
%%
str1 : str2 NL	{flag++;return 1;};|ANY {};
str2 : A B str3	{};
str3 : A str3	{};|B str3 {};|{} {};
%%
int yyerror(){
	printf("Error ");
}
int main()
{
	yyparse();
	if(flag)
		printf("Accept ");
	else
		printf("Reject ");
	return 0;
}
