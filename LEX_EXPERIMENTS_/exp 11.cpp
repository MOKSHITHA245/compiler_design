#include <stdio.h>
#include <string.h>

struct Symbol {
    char name[20], type[10];
    int addr;
};

int main() {
    struct Symbol t[] = {
        {"x", "int", 100},
        {"y", "float", 104},
        {"z", "char", 108}
    };

    int n = 3, i;
    char search[] = "y";

    printf("Symbol Table:\n");
    printf("Name\tType\tAddress\n");

    for (i = 0; i < n; i++)
        printf("%s\t%s\t%d\n", t[i].name, t[i].type, t[i].addr);

    printf("\nSearching for: %s\n", search);

    for (i = 0; i < n; i++) {
        if (strcmp(t[i].name, search) == 0) {
            printf("Symbol Found: %s %s %d\n",
                   t[i].name, t[i].type, t[i].addr);
            return 0;
        }
    }

    printf("Symbol Not Found\n");

    return 0;
}
