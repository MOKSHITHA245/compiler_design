%{
#include <stdio.h>
int word_count = 0;
%}

%%

[a-zA-Z0-9]+    { word_count++; }   /* Matches words containing letters and numbers */
[\t\n]+          ;                  /* Ignore whitespace, tabs, and newlines */
.                ;                  /* Ignore other special characters */

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter input text (Press Ctrl+D on Linux / Ctrl+Z on Windows to end):\n");
    yylex();
    printf("\nTotal Word Count: %d\n", word_count);
    return 0;
}