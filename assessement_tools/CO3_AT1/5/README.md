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

expr
    : expr '+' expr
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
    int value;

    while ((c = getchar()) == ' ' || c == '\t')
        ;

    if (c >= '0' && c <= '9')
    {
        value = 0;

        while (c >= '0' && c <= '9')
        {
            value = value * 10 + (c - '0');
            c = getchar();
        }

        yylval = value;

        if (c != EOF)
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
    int result;

    printf("Enter expression: ");
    result = yyparse();

    if (result == 0)
        printf("Expression evaluated successfully.\n");

    return 0;
}
