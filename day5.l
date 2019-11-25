del [ |{|}|;|(|)]
%{
#include<stdio.h>
#include<string.h>
char s[100];
int letters=0,words=0,lines=0,length=0;
%}
%%
\n	lines++;
([a-zA-Z0-9])*	{if(length<yyleng) {strcpy(s,yytext);length=yyleng;}}
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
	printf("max length=%d %s\n",length,s);
	return 0;
}
