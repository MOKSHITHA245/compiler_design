#include <stdio.h>

int main() {
    char s[] = "a + b * c - d / e";
    int i = 0;

    while (s[i] != '\0') {
        if (s[i] == '+' || s[i] == '-' ||
            s[i] == '*' || s[i] == '/')
            printf("%c : Valid Arithmetic Operator\n", s[i]);

        i++;
    }

    return 0;
}
