%{
#include <stdio.h>
%}

%%

"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return" {
    printf("Keyword: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Valid Identifier: %s\n", yytext);
}

[0-9][a-zA-Z_][a-zA-Z0-9_]* {
    printf("Invalid Identifier: %s\n", yytext);
}

[ \t\n]+ ;

. ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}