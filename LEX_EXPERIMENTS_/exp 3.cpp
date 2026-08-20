#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char s[] = "  int  a = 10;  // comment\n"
               " b = a + 20; /* comment */ ";
    int i = 0;

    while (s[i]) {

        // Ignore spaces, tabs and new lines
        if (isspace(s[i])) {
            i++;
            continue;
        }

        // Ignore comments
        if (s[i] == '/' && s[i+1] == '/') {
            while (s[i] && s[i] != '\n') i++;
            continue;
        }

        if (s[i] == '/' && s[i+1] == '*') {
            i += 2;
            while (s[i] && !(s[i] == '*' && s[i+1] == '/'))
                i++;
            i += 2;
            continue;
        }

        // Identifier
        if (isalpha(s[i]) || s[i] == '_') {
            printf("Identifier: ");
            while (isalnum(s[i]) || s[i] == '_')
                printf("%c", s[i++]);
            printf("\n");
        }

        // Constant
        else if (isdigit(s[i])) {
            printf("Constant: ");
            while (isdigit(s[i]))
                printf("%c", s[i++]);
            printf("\n");
        }

        // Operator
        else if (strchr("+-*/%=<>!", s[i])) {
            printf("Operator: %c\n", s[i++]);
        }

        else
            i++;
    }

    return 0;
}
