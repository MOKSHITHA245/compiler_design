%{
#include <stdio.h>
#include <string.h>

char old_word[50];
char new_word[50];
FILE *output;
%}

%%

[a-zA-Z]+
{
    if (strcmp(yytext, old_word) == 0)
        fprintf(output, "%s", new_word);
    else
        fprintf(output, "%s", yytext);
}

[ \t\n]+
{
    fprintf(output, "%s", yytext);
}

.
{
    fprintf(output, "%s", yytext);
}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter word to replace: ");
    scanf("%49s", old_word);

    printf("Enter new word: ");
    scanf("%49s", new_word);

    yyin = fopen("input.txt", "r");
    output = fopen("output.txt", "w");

    if (yyin == NULL)
    {
        printf("Cannot open input.txt\n");
        return 1;
    }

    if (output == NULL)
    {
        printf("Cannot create output.txt\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(output);

    printf("\nReplacement completed.\n");
    printf("Modified content is stored in output.txt\n");

    return 0;
}