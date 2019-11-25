digit[0-9]
letter[a-zA-Z]
underscore[_]
N [\n]
%%
int|float|main|while|void|return	{printf("Key ");return 1;}
"//"({letter}|{digit})* {return 10;}
\/\*(.*\n)*.*\*\/  		{return 9;}
("+"|"-"|"/"|"*")	{printf("arithmetic_op ");return 2;}
(">="|"<="|"="|"<"|">")	{printf("relational_op ");return 3;}
"-"?{digit}+("."{digit}+)?	{printf("realno ");return 4;}
END return 6;
{letter}({letter}|{digit})*	{printf("id ");return 5;}
%%
int yywrap(){
	return 1;
}
int main()
{
	int c_key=0,c_arithmetic=0,c_logic=0,c_real=0,c_id=0;
	yyin=fopen("ip2.c","r");
	while(1)
	{
		int x=yylex();
		if(x==1) c_key++;
		if(x==2) c_arithmetic++;
		if(x==3) c_logic++;
		if(x==4) c_real++;
		if(x==5) c_id++;
		if(x==6) break;
	}
	printf("\n");
	printf("Key:%d arithmetic_op:%d relational_op:%d realno:%d id:%d\n",c_key,c_arithmetic,c_logic,c_real,c_id);
	return 0;
}
