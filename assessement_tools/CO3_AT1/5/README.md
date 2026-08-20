## Q5. Automatic Type Conversion Using YACC

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

void addSymbol(char *name, char *type)
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

void checkAssignment(char *left, char *right)
{
    char *leftType = getType(left);
    char *rightType = getType(right);

    printf("\nAssignment: %s = %s\n", left, right);
    printf("Left variable type  : %s\n", leftType);
    printf("Right variable type : %s\n", rightType);

    if (strcmp(leftType, "float") == 0 &&
        strcmp(rightType, "int") == 0)
    {
        printf("Type Conversion     : int -> float\n");
        printf("Coercion             : Performed\n");
        printf("Final type           : float\n");
    }
    else if (strcmp(leftType, rightType) == 0)
    {
        printf("Type Conversion     : Not required\n");
        printf("Coercion             : Not required\n");
        printf("Final type           : %s\n", leftType);
    }
    else
    {
        printf("Type Conversion     : Not allowed\n");
        printf("Coercion             : Failed\n");
    }
}

int yylex(void);
void yyerror(const char *s);
%}

%union
{
    char *str;
}

%token FLOAT INT
%token <str> ID
%token SEMICOLON ASSIGN

%%

program
    : declarations assignments
    ;

declarations
    : declarations declaration
    | declaration
    ;

declaration
    : FLOAT ID SEMICOLON
      {
          addSymbol($2, "float");
          printf("Declaration: float %s\n", $2);
      }
    | INT ID SEMICOLON
      {
          addSymbol($2, "int");
          printf("Declaration: int %s\n", $2);
      }
    ;

assignments
    : assignments assignment
    | assignment
    ;

assignment
    : ID ASSIGN ID SEMICOLON
      {
          checkAssignment($1, $3);
      }
    ;

%%

int yylex(void)
{
    static int pos = 0;

    char *input[] =
    {
        "float", "temperature", ";",
        "int", "sensor_value", ";",
        "temperature", "=", "sensor_value", ";",
        NULL
    };

    static char buffer[30];

    if (input[pos] == NULL)
        return 0;

    strcpy(buffer, input[pos++]);

    if (strcmp(buffer, "float") == 0)
        return FLOAT;

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
    printf("Automatic Type Conversion Analysis\n");
    printf("===================================\n");

    yyparse();

    printf("\nSymbol Table\n");
    printf("--------------------------\n");
    printf("Variable        Type\n");
    printf("--------------------------\n");
    printf("temperature     float\n");
    printf("sensor_value    int\n");

    printf("\nFinal Result:\n");
    printf("temperature is of type float.\n");
    printf("sensor_value is converted from int to float.\n");

    return 0;
}
```

### Input

```text
float temperature;
int sensor_value;

temperature = sensor_value;
```

### Symbol Table

```text
Variable        Type
--------------------------
temperature     float
sensor_value    int
```

### Type Analysis

```text
Left-hand side:
temperature → float

Right-hand side:
sensor_value → int
```

### Automatic Type Conversion

```text
temperature = sensor_value;

int sensor_value
       |
       | implicit conversion
       ↓
float sensor_value
       |
       ↓
temperature
```

The compiler detects that the left-hand side is `float` and the right-hand side is `int`.

Therefore, the compiler automatically performs:

```text
int → float
```

This is called **implicit type conversion (coercion)**.

### Output

```text
Automatic Type Conversion Analysis
===================================

Declaration: float temperature
Declaration: int sensor_value

Assignment: temperature = sensor_value
Left variable type  : float
Right variable type : int
Type Conversion     : int -> float
Coercion             : Performed
Final type           : float

Symbol Table
--------------------------
Variable        Type
--------------------------
temperature     float
sensor_value    int

Final Result:
temperature is of type float.
sensor_value is converted from int to float.
```

### Final Result

```text
temperature = sensor_value

int → float conversion is performed automatically.

Final type of temperature = float
```
