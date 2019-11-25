digit[0-9]
letter[a-zA-Z]
%%
int|main|void|while|return	{printf("key ");return 1;}
({digit}*)?(1|3|5|7|9)	{printf("odd ");return 2;}
({digit}*)?(0|2|4|6|8)	{printf("even ");return 3;}
END return 4;
%%
int yywrap(){
	return 1;
}
int main()
{
	int key=0,odd=0,even=0;
	yyin=fopen("ip3.c","r");
	while(1)
	{
		int x=yylex();
		if(x==1) key++;
		if(x==2) odd++;
		if(x==3) even++;
		if(x==4) break;
	}
	printf("key=%d odd=%d even=%d\n",key,odd,even);
	return 0;
}
