#!/bin/python3

import os
import itertools

#
# Complete the 'formingMagicSquare' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY s as parameter.
#

type Triplet = tuple[int, int, int]
type Matrix = tuple[Triplet, Triplet, Triplet]

MAGIC_3_BY_3_CONSTANT = 15


def formingMagicSquare(s: list[list[int]]) -> int:
    triplets: list[Triplet] = list(itertools.permutations(range(1, 3**2 + 1), 3))
    magic_triplets: list[Triplet] = [
        t for t in triplets if sum(t) == MAGIC_3_BY_3_CONSTANT
    ]
    # There are 48 magic triplets.
    # That gives around 10^5 permutations. Most of which will repeat numbers and therefore be invalid.
    # We can try solvind this using brute force from here.
    print(len(magic_triplets))
    solutions: list[Matrix] = []
    for candidates in itertools.permutations(magic_triplets, 3):
        if len(set(n for t in candidates for n in t)) < 9:
            # Invalid candidate, does not have all numbers.
            continue
        # Check colums add up.
        constant_ok = True
        for col in range(3):
            k = candidates[0][col] + candidates[1][col] + candidates[2][col]
            if k != MAGIC_3_BY_3_CONSTANT:
                constant_ok = False
        k = candidates[0][0] + candidates[1][1] + candidates[2][2]
        if k != MAGIC_3_BY_3_CONSTANT:
            constant_ok = False

        k = candidates[2][0] + candidates[1][1] + candidates[0][2]
        if k != MAGIC_3_BY_3_CONSTANT:
            constant_ok = False

        if not constant_ok:
            continue

        solutions.append(tuple(tuple(t) for t in candidates))
    # From empirical evidence, there are 2592 solutions.
    best_cost = 9 * 9  # out of bounds sentinel
    best_sol = None
    for sol in solutions:
        cost = transformation_cost(s, sol)
        if cost < best_cost:
            best_cost = cost
            best_sol = sol
    print(best_sol)

    return best_cost


def transformation_cost(m1: Matrix, m2: Matrix) -> int:
    total = 0
    for i in range(len(m1)):
        for j in range(len(m1[i])):
            total += abs(m1[i][j] - m2[i][j])
    return total


if __name__ == "__main__":
    fptr = open(os.environ["OUTPUT_PATH"], "w")

    s = []

    for _ in range(3):
        s.append(list(map(int, input().rstrip().split())))

    result = formingMagicSquare(s)

    fptr.write(str(result) + "\n")

    fptr.close()
