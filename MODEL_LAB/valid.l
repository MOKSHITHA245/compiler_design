%{
#include <stdio.h>
%}

%%
[A-Za-z_][A-Za-z0-9_]*   { printf("%s : Valid\n",yytext); }
[0-9][A-Za-z0-9_]*       { printf("%s : Invalid\n",yytext); }
[A-Za-z_][A-Za-z0-9_]*-[A-Za-z0-9_]+ { printf("%s : Invalid\n",yytext); }
[ \t\n,]+                ;
.                        { printf("%s : Invalid\n",yytext); }
%%

int main()
{
    printf("Enter identifiers:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}