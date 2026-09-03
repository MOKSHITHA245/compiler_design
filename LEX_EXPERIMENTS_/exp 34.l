%{
#include <stdio.h>
%}

%%

(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/[0-9]{4}
{
    printf("Valid DOB Format\n");
}

.*
{
    printf("Invalid DOB Format\n");
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter Date of Birth (DD/MM/YYYY): ");
    yylex();
    return 0;
}