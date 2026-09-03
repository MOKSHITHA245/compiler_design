%{
#include <stdio.h>

int comment_count = 0;
FILE *output;
%}

%%

"//".*              { comment_count++; }

"/*"([^*]|\*+[^*/])*\*+"/"   
                    { comment_count++; }

\n                  { fprintf(output, "\n"); }

.                   { fprintf(output, "%s", yytext); }

%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("input.c", "r");
    output = fopen("output.c", "w");

    if (yyin == NULL)
    {
        printf("Cannot open input.c\n");
        return 1;
    }

    if (output == NULL)
    {
        printf("Cannot create output.c\n");
        return 1;
    }

    yylex();

    printf("Number of comments = %d\n", comment_count);
    printf("Comments removed successfully.\n");
    printf("Output written to output.c\n");

    fclose(yyin);
    fclose(output);

    return 0;
}
