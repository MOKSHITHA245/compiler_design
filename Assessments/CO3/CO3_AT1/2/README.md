%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct Node
{ 
	char value[10];
struct Node *left;
	struct Node *right; 
};
struct Node* createNode(char value[], struct Node *left, 
		struct Node *right) 
{ 
	struct Node *n;
 







n = (struct Node*)malloc(sizeof(struct Node));
strcpy(n->value, value); 
n->left = left;
n->right = right;
return n;
}
void preorder(struct Node *root) 
{ 
		if(root != NULL) 
	{ 
			printf("%s ", root->value); 
			preorder(root->left); 
			preorder(root->right); 
	} 
}
int yylex(); 
void yyerror(char *s); 
%}
%union
{ 
	struct Node *node;
char *str;
}
%token <str> ID
%type <node> expr
%left '+'
%left '*'
%%
 







expr:
expr '+' expr
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
void yyerror(char *s) 
{ 
	printf("Error\n"); 
}
int main() 
{ 
	printf("Enter expression: "); 
	yyparse();
return 0;
}
Lex Program: q2.l
%{ 
#include "y.tab.h"
 





#include <string.h> 
%}
%%
[a-zA-Z] 		{ 
	yylval.str = strdup(yytext); 
	return ID;
}
[ \t\n] 	;
. 	return yytext[0];
%%

