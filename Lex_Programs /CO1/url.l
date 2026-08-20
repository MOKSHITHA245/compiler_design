%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
^(https?:\/\/)?(www\.)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\/[a-zA-Z0-9_.-]*)*$   { printf("valid URL\n"); exit(0); }
\n                                                                         { /* ignore newline */ }
.                                                                          { printf("invalid URL\n"); exit(0); }
%%

int yywrap()
{
	return 1;
}
int main()
{
	printf("enter a URL: ");
	yylex();
	return 0;
}
