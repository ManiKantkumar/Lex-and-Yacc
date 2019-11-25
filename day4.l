%{
#include<stdio.h>
int letters=0,words=0,lines=0;
%}
%%
\n	{lines++;printf("Line:%d\n",lines);}
([a-zA-Z0-9])*	{words++; letters+=yyleng;}
%%
int yywrap(){
	return 1;
}
int main()
{
	char fname[10];
	printf("enter file name:");
	scanf("%s",fname);
	yyin=fopen(fname,"r");
	int x=yylex();
	printf("lines=%d words=%d letters=%d\n",lines,words,letters);
	return 0;
}
