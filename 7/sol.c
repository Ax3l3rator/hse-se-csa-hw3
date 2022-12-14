#include <stdio.h>
#include <stdlib.h>
#include <string.h>

double findSum(double x) {
    double e = 1;
    double prev = 1;
    double val = 0;
    for (int i = 1; i <= 100; ++i) {
        val = prev * x / i;
        e += val;
        prev = val;
    }
    return (e - 1 / e) / (e + 1 / e);
}

int main(int argc, char const* argv[]) {
    if (argc < 4) {
        printf("Args count???");
        return 1;
    }
    if (!strcmp(argv[1], "--file")) {
        FILE* readf = fopen(argv[2], "r");
        if (readf == NULL) {
            printf("No such file as %s", argv[2]);
            return 1;
        }
        double input;
        FILE* writef = fopen(argv[3], "w");
        fscanf(readf, "%lF", &input);
        fprintf(writef, "%.18F", findSum(input));
        fclose(readf);
        fclose(writef);
    }
    return 0;
}
