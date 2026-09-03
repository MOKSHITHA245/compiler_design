%{
#include <stdio.h>
#include <string.h>

int max_length = 0;
char longest_word[100];
%}

%%

[a-zA-Z]+
{
    if (strlen(yytext) > max_length)
    {
        max_length = strlen(yytext);
        strcpy(longest_word, yytext);
    }
}

[ \t\n]+
{
}

.
{
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a sentence:\n");

    yylex();

    printf("\nLongest word = %s\n", longest_word);
    printf("Length of longest word = %d\n", max_length);

    return 0;
}