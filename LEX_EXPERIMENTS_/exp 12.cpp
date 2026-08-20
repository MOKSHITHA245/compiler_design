#include <stdio.h>
#include <string.h>

char input[] = "id+id*id";
int i = 0;

void E();
void Eprime();
void T();
void Tprime();
void F();

void E() {
    T();
    Eprime();
}

void Eprime() {
    if (input[i] == '+') {
        i++;
        T();
        Eprime();
    }
}

void T() {
    F();
    Tprime();
}

void Tprime() {
    if (input[i] == '*') {
        i++;
        F();
        Tprime();
    }
}

void F() {
    if (strncmp(&input[i], "id", 2) == 0)
        i += 2;
    else if (input[i] == '(') {
        i++;
        E();
        if (input[i] == ')')
            i++;
        else {
            printf("Invalid Expression\n");
            return;
        }
    }
    else
        printf("Invalid Expression\n");
}

int main() {
    E();

    if (input[i] == '\0')
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}
