#include <stdio.h>

double findSum(double x) {
    double e = 1;
    double prev = 1;
    double val = 0;
    for (register int i = 1; i <= 100; ++i) {
        val = prev * x / i;
        e += val;
        prev = val;
    }
    return (e - 1 / e) / (e + 1 / e);
}

int main(void) {
    double input;
    scanf("%lF", &input);
    double result = findSum(input);
    printf("%.18F", result);
    return 0;
}