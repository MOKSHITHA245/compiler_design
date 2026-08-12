%{
#include<stdio.h>
#include<stdlib.h>
intyylex(); 
voidyyerror(char *s); 
%}
%token NUMBER
%left '+'
%left '*'
%%
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
void yyerror(char *s) 
{ 
	printf("Error: %s\n", s); 
}
 





int main() 
{ 
		printf("Enter expression: "); 
		yyparse(); 
	return 0;
}
Lex Program: q1.l
%{ 
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+ 	{ 
		yylval = atoi(yytext); 
		return NUMBER;
}
[ \t] 	;
\n 	return '\n';
. 	return yytext[0];
%%

