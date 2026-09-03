#include <stdio.h>
#include <string.h>

int main()
{
    char tac[100];
    char result[20], op1[20], op2[20], op[5];

    printf("Enter Three Address Code:\n");
    fgets(tac, sizeof(tac), stdin);

    /* Read TAC in the form: t1 = b + c */
    sscanf(tac, "%s = %s %s %s", result, op1, op, op2);

    printf("\nTarget Machine Instructions:\n");

    printf("MOV R0, %s\n", op1);

    if (strcmp(op, "+") == 0)
        printf("ADD R0, %s\n", op2);

    else if (strcmp(op, "-") == 0)
        printf("SUB R0, %s\n", op2);

    else if (strcmp(op, "*") == 0)
        printf("MUL R0, %s\n", op2);

    else if (strcmp(op, "/") == 0)
        printf("DIV R0, %s\n", op2);

    printf("MOV %s, R0\n", result);

    return 0;
}