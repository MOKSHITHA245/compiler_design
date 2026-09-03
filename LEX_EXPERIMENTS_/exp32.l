%{
#include <stdio.h>

int positive = 0;
int negative = 0;
%}

%%

-[0-9]+        {
                    printf("Negative Number: %s\n", yytext);
                    negative++;
                }

[+]?[0-9]+     {
                    printf("Positive Number: %s\n", yytext);
                    positive++;
                }

[ \t\n]+       ;

.              ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter numbers:\n");

    yylex();

    printf("\nNumber of positive numbers = %d\n", positive);
    printf("Number of negative numbers = %d\n", negative);

    return 0;
}