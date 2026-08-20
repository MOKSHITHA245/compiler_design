#include <stdio.h>
#include <string.h>

char s[] = "id+id*id";
int i = 0, error = 0;

void E();
void Ep();
void T();
void Tp();
void F();

void E() {
    T();
    Ep();
}

void Ep() {
    if (s[i] == '+') {
        i++;
        T();
        Ep();
    }
}

void T() {
    F();
    Tp();
}

void Tp() {
    if (s[i] == '*') {
        i++;
        F();
        Tp();
    }
}

void F() {
    if (s[i] == '(') {
        i++;
        E();
        if (s[i] == ')')
            i++;
        else
            error = 1;
    }
    else if (strncmp(&s[i], "id", 2) == 0)
        i += 2;
    else
        error = 1;
}

int main() {
    E();

    if (s[i] == '\0' && error == 0)
        printf("String is Accepted\n");
    else
        printf("String is Rejected\n");

    return 0;
}
