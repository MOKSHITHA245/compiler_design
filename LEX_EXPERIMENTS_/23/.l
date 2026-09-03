%{
#include <stdio.h>
int line_no = 1;
%}

%%
\n              { printf("%4d  %s", line_no++, yytext); }
.               { printf("%s", yytext); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("sample.c", "r");

    if (yyin == NULL)
    {
        printf("Cannot open sample.c\n");
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}
