/**
 * reorder the vector such that odd numbers are before even numbers
 * this problem is not complicated in nature. but the following design makes the
 * code reusable. You will stand a better chance in interview
 */
#include <vector>
#include <cassert>

void swapIntegers(int &num1, int &num2) {
    int temp = num1;
    num1 = num2;
    num2 = temp;
}

void reorder(int *nums, int size, bool (*compare)(int)) {
    int left = 0;
    int right = size - 1;
    while (left < right) {
        while (left < right && (compare(nums[left]))) {
            left++;
        }
        while (right > left && !(compare(nums[right]))) {
            right--;
        }
        if (left < right) {
            swapIntegers(nums[left], nums[right]);
            left++;
            right--;
        }
    }
}

bool isOdd(int number) {
    return (number & 0x1) == 1;
}

void reorderEvenOdd(int *nums, int size) {
    reorder(nums, size, isOdd);
}

int main(int argc, char const *argv[]) {
    int nums1[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
    int nums2[10] = {1, 3, 5, 7, 9, 0, 2, 4, 6, 8};
    reorderEvenOdd(nums1, 10);
    reorderEvenOdd(nums2, 10);
    for (int i=0;i<5;i++) {
        assert(nums1[i] & 0x1);
        assert(nums2[i] & 0x1);
    }
    return 0;
}
