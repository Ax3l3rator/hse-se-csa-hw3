#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

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

double generate() {
    return (double)rand() / RAND_MAX;
}

int main(int argc, char const* argv[]) {
    if (argc < 2) {
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
        clock_t t = clock();
        input = findSum(input);
        t = clock() - t;
        printf("%lF", (double)t / CLOCKS_PER_SEC);
        fprintf(writef, "%.18F", input);
        fclose(readf);
        fclose(writef);
    }
    if (!strcmp(argv[1], "--rand")) {
        FILE* writef = fopen(argv[2], "w");
        clock_t t = clock();
        double a = findSum(generate());
        t = clock() - t;
        fprintf(writef, "%.18F", a);
    }
    return 0;
}
