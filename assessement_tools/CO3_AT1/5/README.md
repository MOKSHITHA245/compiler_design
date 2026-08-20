%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+'
%left '*'

%%

input:
    expr '\n'
    {
        printf("Computed Result = %d\n", $1);
    }
    ;

expr:
      expr '+' expr
    {
        $$ = $1 + $3;
    }
    | expr '*' expr
    {
        $$ = $1 * $3;
    }
    | NUMBER
    {
        $$ = $1;
    }
    ;

%%

int yylex(void)
{
    int c;

    while ((c = getchar()) == ' ' || c == '\t')
        ;

    if (c >= '0' && c <= '9')
    {
        int value = 0;

        do
        {
            value = value * 10 + (c - '0');
            c = getchar();
        }
        while (c >= '0' && c <= '9');

        yylval = value;
        ungetc(c, stdin);
        return NUMBER;
    }

    return c;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main(void)
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}
