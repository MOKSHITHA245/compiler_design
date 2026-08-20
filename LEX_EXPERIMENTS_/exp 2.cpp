#include <stdio.h>
#include <string.h>

int main() {
    char s[] = "/* This is a comment */";

    if (strncmp(s, "//", 2) == 0)
        printf("It is a single-line comment\n");

    else if (strncmp(s, "/*", 2) == 0 &&
             strstr(s, "*/") != NULL)
        printf("It is a multi-line comment\n");

    else
        printf("It is not a comment\n");

    return 0;
}
