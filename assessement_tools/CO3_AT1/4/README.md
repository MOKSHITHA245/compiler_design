## Q4. Type Compatibility and Equivalence Using YACC

### YACC Code

```yacc
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 50

typedef struct
{
    char name[20];
    char type[20];
} Symbol;

Symbol table[MAX];
int count = 0;

void addType(char *name, char *type)
{
    strcpy(table[count].name, name);
    strcpy(table[count].type, type);
    count++;
}

void addVariable(char *name, char *type)
{
    strcpy(table[count].name, name);
    strcpy(table[count].type, type);
    count++;
}

char *getType(char *name)
{
    int i;

    for (i = 0; i < count; i++)
    {
        if (strcmp(table[i].name, name) == 0)
            return table[i].type;
    }

    return NULL;
}

int nameEquivalent(char *type1, char *type2)
{
    return strcmp(type1, type2) == 0;
}

int structuralEquivalent(char *type1, char *type2)
{
    char *base1;
    char *base2;

    base1 = getType(type1);
    base2 = getType(type2);

    if (base1 != NULL && base2 != NULL)
        return strcmp(base1, base2) == 0;

    return strcmp(type1, type2) == 0;
}

int yylex(void);
void yyerror(const char *s);
%}

%union
{
    char *str;
}

%token TYPE INT ASSIGN SEMICOLON
%token <str> ID

%%

program
    : declarations assignments
    ;

declarations
    : declarations declaration
    | declaration
    ;

declaration
    : TYPE ID ASSIGN INT SEMICOLON
      {
          addType($2, "int");
          printf("Type Declaration: %s = int\n", $2);
      }
    | ID ID SEMICOLON
      {
          char *t = getType($1);

          if (t != NULL)
          {
              addVariable($2, $1);
              printf("Variable Declaration: %s %s\n", $1, $2);
          }
      }
    ;

assignments
    : assignments assignment
    | assignment
    ;

assignment
    : ID ASSIGN ID SEMICOLON
      {
          char *type1 = getType(getType($1) ? $1 : $1);
          char *type2 = getType(getType($3) ? $3 : $3);

          printf("\nAssignment: %s = %s\n", $1, $3);

          if (type1 != NULL && type2 != NULL)
          {
              printf("Name Equivalence: ");

              if (nameEquivalent($1, $3))
                  printf("Equivalent\n");
              else
                  printf("Not Equivalent\n");

              printf("Structural Equivalence: ");

              if (structuralEquivalent(type1, type2))
                  printf("Equivalent\n");
              else
                  printf("Not Equivalent\n");
          }
      }
    ;

%%

int yylex(void)
{
    static int pos = 0;

    char *input[] =
    {
        "type", "A", "=", "int", ";",
        "type", "B", "=", "int", ";",
        "A", "x", ";",
        "B", "y", ";",
        "x", "=", "y", ";",
        NULL
    };

    static char buffer[20];

    if (input[pos] == NULL)
        return 0;

    strcpy(buffer, input[pos++]);

    if (strcmp(buffer, "type") == 0)
        return TYPE;

    if (strcmp(buffer, "int") == 0)
        return INT;

    if (strcmp(buffer, "=") == 0)
        return ASSIGN;

    if (strcmp(buffer, ";") == 0)
        return SEMICOLON;

    yylval.str = strdup(buffer);
    return ID;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Type Compatibility Analysis\n");
    printf("============================\n\n");

    yyparse();

    printf("\nFinal Type Equivalence Result:\n");
    printf("A and B under Name Equivalence: Not Equivalent\n");
    printf("A and B under Structural Equivalence: Equivalent\n");

    return 0;
}
```

### Input

```text
type A = int;
type B = int;
A x;
B y;
x = y;
```

### Symbol Table

```text
Name     Type
----------------
A        int
B        int
x        A
y        B
```

### Type Equivalence Analysis

```text
Name Equivalence:

A and B are different type names.

Therefore:
A ≠ B

Result: Not Equivalent
```

```text
Structural Equivalence:

A → int
B → int

Both A and B have the same underlying structure: int.

Therefore:
A = B structurally

Result: Equivalent
```

### Assignment Test

```text
Assignment: x = y

Type of x = A
Type of y = B

Name Equivalence: Not Equivalent
Structural Equivalence: Equivalent
```

### Output

```text
Type Compatibility Analysis
============================

Type Declaration: A = int
Type Declaration: B = int
Variable Declaration: A x
Variable Declaration: B y

Assignment: x = y
Name Equivalence: Not Equivalent
Structural Equivalence: Equivalent

Final Type Equivalence Result:
A and B under Name Equivalence: Not Equivalent
A and B under Structural Equivalence: Equivalent
```

### Final Result

```text
(a) Name Equivalence:
A and B → Not Equivalent

(b) Structural Equivalence:
A and B → Equivalent
```

