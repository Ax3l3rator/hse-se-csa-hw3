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

int main(int argc, char const *argv[]) {
    /* code */
    return 0;
}
