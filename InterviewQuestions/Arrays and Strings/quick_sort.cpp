#include <cstdio>
#include <iostream>
#include <cassert>

void swapIntegers(int &num1, int &num2) {
    int temp = num1;
    num1 = num2;
    num2 = temp;
}

int choosePivot(int num1, int num2, int num3) {
    if ((num1 >= num2 && num2 >= num3) || (num3 >= num2 && num2 >= num1)) {
        return num2;
    } else if ((num2 >= num1 && num1 >= num3) || (num3 >= num1 && num1 >= num2)) {
        return num1;
    } else {
        return num3;
    }
}

void quickSort1(int arr[], int left, int right) {
    int smaller = left;
    int larger = right;
    int pivot = choosePivot(arr[left], arr[right], arr[(left + right) / 2]);

    /* partition */
    while (smaller <= larger) {
        while (arr[smaller] < pivot && smaller <= larger) {
            smaller++;
        }
        while (arr[larger] > pivot) {
            larger--;
        }
        if (smaller <= larger) {
            swapIntegers(arr[smaller], arr[larger]);
            smaller++;
            larger--;
        }
    }
    /* recursion */
    if (left < larger) {
        quickSort1(arr, left, larger);
    }
    if (smaller < right) {
        quickSort1(arr, smaller, right);
    }
}

int quickSortPartition(int arr[], int start, int end) {
    int pivot = arr[end];
    int idx = start;
    for (int i=start;i<end;i++) {
        if (pivot > arr[i]) {
            swapIntegers(arr[i], arr[idx]);
            idx++;
        }
    }
    swapIntegers(arr[idx], arr[end]);
    return idx;
}

void quickSort2(int arr[], int left, int right) {
    if (left >= right) {
        return;
    }
    int pivotIdx = quickSortPartition(arr, left, right);
    quickSort2(arr, left, pivotIdx - 1);
    quickSort2(arr, pivotIdx + 1, right);
}

int main(int argc, char const *argv[]) {
    int nums1[11] = {0, 2, 4, 6, 8, 1, 3, 5, 7, 9, 0};
    int nums2[11] = {9, 2, 3, 5, 4, 1, 7, 6, 8, 0, 9};
    quickSort1(nums1, 0, 10);
    quickSort1(nums2, 0, 10);
    for (int i=0;i<10;i++) {
        assert(nums1[i] <= nums1[i + 1]);
        assert(nums2[i] <= nums2[i + 1]);
    }
    return 0;
}
