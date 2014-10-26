/**
 * find a number in a rotated sorted array. all elements in sorted array are unique.
 * if the array is non-decreasing, more edge cases have to be considered
 */
#include <cstdio>
#include <iostream>
#include <vector>
#include <cassert>

using namespace std;

int findNumberInArr(int *nums, int start, int end, int number) {
    if (end < start) {
        return -1;
    }
    int middle = (start + end) / 2;
    if (nums[middle] == number) {
        return middle;
    } else if (nums[middle] < number) {
        if (nums[middle] < nums[start]) {
            int temp1 = findNumberInArr(nums, middle + 1, end, number);
            int temp2 = findNumberInArr(nums, start, middle - 1, number);
            return temp1 == -1 ? temp2 : temp1;
        } else {
            return findNumberInArr(nums, middle + 1, end, number);
        }
    } else {
        if (nums[middle] > nums[end]) {
            int temp1 = findNumberInArr(nums, middle + 1, end, number);
            int temp2 = findNumberInArr(nums, start, middle -1, number);
            return temp1 == -1 ? temp2 : temp1;
        } else {
            return findNumberInArr(nums, start, middle - 1, number);
        }
    }
}

int findNumber(int *nums, int size, int number) {
    return findNumberInArr(nums, 0, size - 1, number);
}

int findMinInRotated(int *nums, int start, int end) {
    if (end == start) {
        return nums[start];
    } else if (end == start + 1){
        return nums[start] > nums[end] ? nums[end] : nums[start];
    }
    int middle = (start + end) / 2;
    if (nums[middle] > nums[start]) {
        if (nums[middle] < nums[end]) {
            return nums[start];
        } else {
            return findMinInRotated(nums, middle, end);
        }
    } else {
        if (nums[middle] < nums[end]) {
            return findMinInRotated(nums, start, middle);
        } else {
            return findMinInRotated(nums, middle, end);
        }
    }
}

int findMinInRotatedSorted(int *nums, int size) {
    if (size < 0) {
        return -1;  // denote illegal min
    } else if (size == 1) {
        return *nums;
    }
    return findMinInRotated(nums, 0, size - 1);
}

int main(int argc, char const *argv[]){
    int nums[10] = {5, 6, 7, 8, 9, 0, 1, 2, 3, 4};
    assert(1 == findNumber(nums, 10, 6));
    assert(4 == findNumber(nums, 10, 9));
    assert(5 == findNumber(nums, 10, 0));
    assert(7 == findNumber(nums, 10, 2));
    assert(-1 == findNumber(nums, 10, 10));
    assert(-1 == findNumber(nums, 10, -1));
    printf("Searching is done\n");
    assert(0 == findMinInRotatedSorted(nums, 10));
    int nums2[10] = {7, 8, 9, 0, 1, 2, 3, 4, 5, 6};
    assert(0 == findMinInRotatedSorted(nums2, 10));
    int nums3[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    assert(0 == findMinInRotatedSorted(nums3, 10));
    printf("Finding min is done\n");
    return 0;
}
