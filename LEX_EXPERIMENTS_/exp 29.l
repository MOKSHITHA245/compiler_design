%{
#include <stdio.h>
%}

%%

"#include"<[^>]+>      { printf("HEADER FILE  : %s\n", yytext); }

"int"|"float"|"char"|"double"|"void"|"return"|"if"|"else"|"for"|"while"
                        { printf("KEYWORD      : %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER   : %s\n", yytext); }

[0-9]+                  { printf("CONSTANT     : %s\n", yytext); }

\"([^\"\\]|\\.)*\"      { printf("STRING       : %s\n", yytext); }

"=="|"!="|"<="|">="|"++"|"--"|"+"|"-"|"*"|"/"|"="|"<"|">"
                        { printf("OPERATOR     : %s\n", yytext); }

[(){};,]                { printf("SPECIAL SYMBOL: %s\n", yytext); }

[ \t\n]+                ;

.                       { printf("UNKNOWN      : %s\n", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("sample.c", "r");

    if (yyin == NULL)
    {
        printf("Cannot open sample.c\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}