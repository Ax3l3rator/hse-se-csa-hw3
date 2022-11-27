#include <stdio.h>
#include <string.h>

double findSum(register double x) {
    register double e = 1;
    register double prev = 1;
    register double val = 0;
    for (register int i = 1; i <= 100; ++i) {
        val = prev * x / i;
        e += val;
        prev = val;
    }
    return (e - 1 / e) / (e + 1 / e);
}

int main(int argc, char const* argv[]) {
    if (argc <= 4) {
        return 1;
    }
    double input;
    if (!strcmp(argv[1], "--file")) {
        char *in_name, out_name;
        in_name = argv[2];
        out_name = argv[3];
    }
    double result = findSum(input);
    printf("%.18F", result);
    return 0;
}