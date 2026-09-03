%{
#include <stdio.h>
#include <string.h>

char search_word[50];
int count = 0;
%}

%%

[a-zA-Z]+
{
    if (strcmp(yytext, search_word) == 0)
        count++;
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
    printf("Enter the word to search: ");
    scanf("%49s", search_word);

    getchar();

    printf("Enter the sentence:\n");

    yylex();

    printf("\nFrequency of \"%s\" = %d\n",
           search_word, count);

    return 0;
}