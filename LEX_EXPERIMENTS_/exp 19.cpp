%{
#include <stdio.h>

int chars = 0, words = 0, lines = 0;
%}

%%

"//".*                  { chars += yyleng; }
"/*"([^*]|\*+[^*/])*\*+"/" {
                          chars += yyleng;
                          for(int i=0; i<yyleng; i++)
                              if(yytext[i] == '\n') lines++;
                        }

\n                      { lines++; chars++; }

[ \t]+                  { chars += yyleng; }

[A-Za-z_][A-Za-z0-9_]*  { words++; chars += yyleng; }

[0-9]+                  { words++; chars += yyleng; }

.                       { chars++; }

%%

int main()
{
    yyin = fopen("sample.c", "r");

    if (yyin == NULL) {
        printf("Cannot open sample.c\n");
        return 1;
    }

    yylex();

    printf("Number of characters = %d\n", chars);
    printf("Number of words      = %d\n", words);
    printf("Number of lines      = %d\n", lines);

    fclose(yyin);
    return 0;
}

int yywrap()
{
    return 1;
}
