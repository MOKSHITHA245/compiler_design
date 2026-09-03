%{
#include <stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%
[aAeEiIoOuU]    { vowels++; }
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]    { consonants++; }
.               ;
%%

int main()
{
    printf("Enter a sentence: ");
    yylex();

    printf("\nNumber of vowels = %d", vowels);
    printf("\nNumber of consonants = %d\n", consonants);

    return 0;
}

int yywrap()
{
    return 1;
}

