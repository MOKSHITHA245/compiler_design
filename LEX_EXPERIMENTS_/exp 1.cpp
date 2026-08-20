
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char s[] = "int a = 10; // comment\n"
               "int b = 20;\n"
               "c = a + b; /* comment */";

    int i = 0;

    while (s[i] != '\0') {
        if (isspace(s[i])) {
            i++;
            continue;
        }

        if (isalpha(s[i]) || s[i] == '_') {
            printf("Identifier: ");
            while (isalnum(s[i]) || s[i] == '_')
                printf("%c", s[i++]);
            printf("\n");
        }
        else if (isdigit(s[i])) {
            printf("Constant: ");
            while (isdigit(s[i]))
                printf("%c", s[i++]);
            printf("\n");
        }
        else if (strchr("+-*/=<>%", s[i])) {
            printf("Operator: %c\n", s[i++]);
        }
        else
            i++;
    }

    return 0;
}
