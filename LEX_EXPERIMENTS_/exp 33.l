%{
#include <stdio.h>
%}

%%

https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(/[^ \t\n]*)?
{
    printf("Valid URL\n");
}

.*  
{
    printf("Invalid URL\n");
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter URL: ");
    yylex();
    return 0;
}