## Q2. Syntax Tree Construction Using YACC

### YACC Code

```yacc
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node
{
    char value[20];
    struct Node *left;
    struct Node *right;
} Node;

Node *createNode(char *value, Node *left, Node *right)
{
    Node *newNode = (Node *)malloc(sizeof(Node));

    strcpy(newNode->value, value);
    newNode->left = left;
    newNode->right = right;

    return newNode;
}

void preorder(Node *root)
{
    if (root != NULL)
    {
        printf("%s ", root->value);
        preorder(root->left);
        preorder(root->right);
    }
}

void inorder(Node *root)
{
    if (root != NULL)
    {
        inorder(root->left);
        printf("%s ", root->value);
        inorder(root->right);
    }
}

void postorder(Node *root)
{
    if (root != NULL)
    {
        postorder(root->left);
        postorder(root->right);
        printf("%s ", root->value);
    }
}

int yylex(void);
void yyerror(const char *s);

Node *root;
%}

%union
{
    Node *node;
    char *text;
}

%token <text> ID
%left '+'
%left '*'

%type <node> expr

%%

expr
    : expr '+' expr
      {
          $$ = createNode("+", $1, $3);
      }
    | expr '*' expr
      {
          $$ = createNode("*", $1, $3);
      }
    | ID
      {
          $$ = createNode($1, NULL, NULL);
      }
    ;

%%

int yylex(void)
{
    int c;
    char buffer[20];
    int i = 0;

    while ((c = getchar()) == ' ' || c == '\t')
        ;

    if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
    {
        buffer[i++] = c;

        while ((c = getchar()) != EOF &&
               ((c >= 'a' && c <= 'z') ||
                (c >= 'A' && c <= 'Z')))
        {
            buffer[i++] = c;
        }

        buffer[i] = '\0';

        if (c != EOF)
            ungetc(c, stdin);

        yylval.text = strdup(buffer);
        return ID;
    }

    return c;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Input: a + b * c\n");

    yyparse();

    root = NULL;

    printf("\nPreorder Traversal: ");
    preorder(root);

    printf("\nInorder Traversal: ");
    inorder(root);

    printf("\nPostorder Traversal: ");
    postorder(root);

    return 0;
}
```

### Input

```text
a + b * c
```

### Abstract Syntax Tree

```text
        +
       / \
      a   *
         / \
        b   c
```

### Traversal Order

```text
Preorder:  + a * b c
Inorder:   a + b * c
Postorder: a b c * +
```

### Result

```text
Expression: a + (b * c)
```
