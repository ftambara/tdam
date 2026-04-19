#include <stdio.h>

#define MAX_N (10000 << 2)

int knownLengths[MAX_N];

int CycleLength(int n) {
    int length;

    if (n == 1) {
        return 1;
    }

    if (n < MAX_N && knownLengths[n]) {
        return knownLengths[n];
    }

    if (n % 2 == 1) {
        length = 1 + CycleLength(3*n + 1);
    } else {
        length = 1 + CycleLength(n / 2);
    }
    if (n < MAX_N) {
        knownLengths[n] = length;
    }
    return length;
}

int main(void) {
    int i, j;

    int maxCycle;

    int n; /* loop variable */
    int l; /* loop iteration cycle lengh */

    while (scanf("%d %d", &i, &j) == 2) {
        maxCycle = 0;
        for (n = i; n <= j; n++) {
            l = CycleLength(n);
            if (l > maxCycle) {
                maxCycle = l;
            }
        }
        printf("%d %d %d\n", i, j, maxCycle);
    }

    return 0;
}
