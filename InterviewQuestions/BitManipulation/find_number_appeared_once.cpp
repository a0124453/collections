#include <cassert>
#include <cstdio>

int findNumberAppearedOnce(int *nums, int size) {
    int result =  0;
    for (int i=0;i<size;i++) {
        result ^= nums[i];
    }
    return result;
}

int main(int argc, char const *argv[]) {
    int nums[11] = {1, 2, 3, 4, 5, 6, 5, 3, 2, 4, 1};
    assert(findNumberAppearedOnce(nums, 11) == 6);
    printf("Done with program\n");
    return 0;
}
