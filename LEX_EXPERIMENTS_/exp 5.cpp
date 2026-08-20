#include <stdio.h>

int main() {
    char s[] = "Hello World\nC Programming\nLexical Analyzer";
    int i, spaces = 0, newlines = 0;

    for (i = 0; s[i] != '\0'; i++) {
        if (s[i] == ' ' || s[i] == '\t')
            spaces++;
        else if (s[i] == '\n')
            newlines++;
    }

    printf("Number of whitespaces = %d\n", spaces);
    printf("Number of newlines = %d\n", newlines);

    return 0;
}
