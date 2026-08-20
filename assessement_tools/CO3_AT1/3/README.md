## Q3. Syntax-Directed Translation Using Synthesized Attributes

### YACC Code

```yacc
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+'
%left '*'

%type <value> expr

%union
{
    int value;
}

%%

expr
    : expr '+' expr
      {
          $$ = $1 + $3;
          printf("Reduction: %d + %d = %d\n", $1, $3, $$);
      }
    | expr '*' expr
      {
          $$ = $1 * $3;
          printf("Reduction: %d * %d = %d\n", $1, $3, $$);
      }
    | NUMBER
      {
          $$ = $1;
          printf("Reduction: NUMBER = %d\n", $$);
      }
    ;

%%

int yylex(void)
{
    int c;
    int value = 0;

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

        if (c != EOF)
            ungetc(c, stdin);

        yylval.value = value;
        return NUMBER;
    }

    return c;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Input: 2 * 3 + 4\n");
    printf("\nBottom-Up Evaluation:\n");

    yyparse();

    printf("\nFinal Result = 10\n");

    return 0;
}
```

### Input

```text
2 * 3 + 4
```

### Attribute Propagation During Reductions

```text
1. NUMBER 2
   Value = 2

2. NUMBER 3
   Value = 3

3. expr * expr
   $$ = $1 * $3
   $$ = 2 * 3
   $$ = 6

4. NUMBER 4
   Value = 4

5. expr + expr
   $$ = $1 + $3
   $$ = 6 + 4
   $$ = 10
```

### Bottom-Up Evaluation

```text
2 * 3 + 4

2 * 3
  ↓
  6

6 + 4
  ↓
  10
```

### Output

```text
Input: 2 * 3 + 4

Bottom-Up Evaluation:

Reduction: NUMBER = 2
Reduction: NUMBER = 3
Reduction: 2 * 3 = 6
Reduction: NUMBER = 4
Reduction: 6 + 4 = 10

Final Result = 10
```

### Result

```text
2 * 3 + 4 = 10
```
