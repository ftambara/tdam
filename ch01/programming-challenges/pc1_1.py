import sys


def three_plus_one(n):
    result = []
    while True:
        result.append(n)
        if n == 1:
            break
        if n % 2 == 1:
            n = 3*n + 1
        else:
            n = n//2
    return result


def main():
    for line in sys.stdin:
        pair = line.strip().split(" ")
        if len(pair) != 2:
            continue
        i_str, j_str = pair
        i = int(i_str)
        j = int(j_str)

        largest_cycle = 0
        for n in range(i, j+1):
            cycle = three_plus_one(n)
            if len(cycle) > largest_cycle:
                largest_cycle = len(cycle)

        print(i_str, j_str, largest_cycle)

if __name__ == "__main__":
    main()
