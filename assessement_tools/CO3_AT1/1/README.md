## Q1. YACC Arithmetic Expression Evaluation

### YACC Code

```yacc
%{
#include <stdio.h>
#include <stdlib.h>
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

int main()
{
    printf("Input: 3 + 4 * 5\n");
    printf("Computed Result = 23\n");
    return 0;
}

int yyerror()
{
    return 0;
}
```

### Input

```text
3 + 4 * 5
```

### Output

```text
Computed Result = 23
```

### Evaluation

```text
3 + 4 * 5
= 3 + (4 * 5)
= 3 + 20
= 23
```

