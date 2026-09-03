#include <stdio.h>

int main()
{
    char a,b,c,x;
    
    printf("Enter expression (x=a*b+c): ");
    scanf("%c=%c*%c+%c",&x,&a,&b,&c);

    printf("\nTriple Table\n");
    printf("No.\tOp\tArg1\tArg2\n");
    printf("0\t*\t%c\t%c\n",a,b);
    printf("1\t+\t(0)\t%c\n",c);
    printf("2\t=\t(1)\t%c\n",x);

    printf("\nPointer Table\n");
    printf("Pointer\tTriple\n");
    printf("0\t0\n1\t1\n2\t2\n");

    return 0;
}