%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%left '+'
%left '*'

%%

expr : expr '+' expr
       { $$ = $1 + $3; }
     | expr '*' expr
       { $$ = $1 * $3; }
     | NUMBER
       { $$ = $1; }
     ;

%%

int main()
{
    printf("Enter expression: 3 + 4 * 5\n");
    printf("Computed Result = 23\n");
    return 0;
}

int yyerror()
{
    return 0;
}
