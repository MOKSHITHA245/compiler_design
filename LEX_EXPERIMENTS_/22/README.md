%{
#include <stdio.h>

int tags = 0;
%}

%%
"<"[^>]*">"    { tags++; }
.               ;
\n              ;
%%

int main()
{
    yyin = fopen("sample.html", "r");

    if (yyin == NULL)
    {
        printf("Cannot open sample.html\n");
        return 1;
    }

    yylex();

    fclose(yyin);

    printf("Number of HTML tags = %d\n", tags);

    return 0;
}

int yywrap()
{
    return 1;
}
