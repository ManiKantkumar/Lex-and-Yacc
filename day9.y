%{
#include <stdio.h>
char ch;
int yylex();
void yyerror();
int flag=0;
%}
%name parse
%token A S M D ID NL ANY
%%
str1 : str2 NL {flag++;return 1;}; | ANY {};
str2 : str2 A str3 {printf("+");}; | str2 S str3 {printf("-");};|str3 {};
str3 : str3 M str4 {printf("*");}; | str3 D str4 {printf("/");};|str4 {};
str4 : ID {printf("%c",ch);};
%%
void yyerror(){
	printf("Conversion Error \n");
}
int main()
{
	
	yyparse();
	if(flag)
		printf("\nConverted Postfix Expression Successfully");
	else
		printf("Try again");
	return 0;
}
