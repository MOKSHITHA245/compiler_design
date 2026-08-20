#include <stdio.h>
#include <ctype.h>

int main() {
    char exp[] = "a+b*c";
    char op1, op2, op;
    int t = 1;

    printf("Input: %s\n", exp);
    printf("Three Address Code:\n");

    op1 = exp[2];
    op = exp[1];
    op2 = exp[0];

    printf("t%d = %c %c %c\n", t++, op2, op, op1);

    op1 = 't' + (t - 1);
    printf("t%d = %c * %c\n", t++, exp[0], exp[2]);

    return 0;
}
