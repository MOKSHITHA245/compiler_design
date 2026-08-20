#include <stdio.h>

int main() {
    char op1, op2, op;
    int t;

    printf("Enter TAC (example: t1=a+b): ");
    scanf("t%d=%c%c%c", &t, &op1, &op, &op2);

    printf("\nTarget Code:\n");
    printf("MOV R0, %c\n", op1);

    switch(op) {
        case '+': printf("ADD R0, %c\n", op2); break;
        case '-': printf("SUB R0, %c\n", op2); break;
        case '*': printf("MUL R0, %c\n", op2); break;
        case '/': printf("DIV R0, %c\n", op2); break;
        default: printf("Invalid operator\n");
    }

    printf("MOV t%d, R0\n", t);

    return 0;
}
