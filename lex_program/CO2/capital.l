%{
#include <stdio.h>
#include <ctype.h>
%}

%%

[a-z]    { printf("%c", toupper(yytext[0])); }
.|\n     { printf("%s", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter text to capitalize:\n");
    yylex();
    return 0;
}