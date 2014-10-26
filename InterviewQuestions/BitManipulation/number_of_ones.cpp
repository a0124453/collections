#include <cstdio>
#include <cassert>

int numberOfOnesSlow(int num) {
    int flag = 1;
    int count = 0;
    while (flag != 0) {
        if ((num & flag) != 0) {
            count++;
        }
        flag = flag<<1;
    }

    return count;
}

int numberOfOnesFast(int num) {
    int count = 0;
    while (num != 0) {
        count++;
        num = num&(num - 1);
    }

    return count;
}

int main(int argc, char const *argv[])
{
    int test1 = 1;
    int test2 = -1;
    int test3 = 0x6605;
    int test4 = 0;
    assert(numberOfOnesSlow(test1) == 1);
    assert(numberOfOnesFast(test1) == 1);
    assert(numberOfOnesSlow(test2) == 32);  // on 32-bit machine
    assert(numberOfOnesFast(test2) == 32);
    assert(numberOfOnesSlow(test3) == 6);
    assert(numberOfOnesFast(test3) == 6);
    assert(numberOfOnesSlow(test4) == 0);
    assert(numberOfOnesFast(test4) == 0);
    printf("Done with program\n");
    return 0;
}
