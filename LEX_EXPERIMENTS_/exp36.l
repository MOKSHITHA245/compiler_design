%{
#include <stdio.h>
#include <stdlib.h>

int num1, num2;
%}

%%
[0-9]+[ \t]*\+[ \t]*[0-9]+
{
    sscanf(yytext, "%d + %d", &num1, &num2);
    printf("Addition = %d\n", num1 + num2);
}

[0-9]+[ \t]*-[ \t]*[0-9]+
{
    sscanf(yytext, "%d - %d", &num1, &num2);
    printf("Subtraction = %d\n", num1 - num2);
}

[0-9]+[ \t]*\*[ \t]*[0-9]+
{
    sscanf(yytext, "%d * %d", &num1, &num2);
    printf("Multiplication = %d\n", num1 * num2);
}

[0-9]+[ \t]*/[ \t]*[0-9]+
{
    sscanf(yytext, "%d / %d", &num1, &num2);

    if (num2 != 0)
        printf("Division = %d\n", num1 / num2);
    else
        printf("Division by zero is not allowed\n");
}

.*
{
    printf("Invalid expression\n");
}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter mathematical expression: ");
    yylex();
    return 0;
}