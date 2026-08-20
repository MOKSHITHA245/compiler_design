%{
#include <stdio.h>
int comment_count = 0;
%}

%%

"//".*                    { comment_count++; printf("Single-line comment found\n"); }
"/*"([^*]|\*+[^*/])*\*+"/" { comment_count++; printf("Multi-line comment found\n"); }
\n                        ;
.                         { /* Ignore any other character */ }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code snippet (Press Ctrl+D to finish):\n");
    yylex();
    printf("\nTotal comments found: %d\n", comment_count);
    return 0;
}