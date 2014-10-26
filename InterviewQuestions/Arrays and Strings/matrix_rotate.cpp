/**
 * This program will take a square matrix and rotate right by 90 degrees in place
 */
#include <iostream>
#include <cstdio>
#include <vector>
#include <cassert>

using namespace std;

/**
 * 0 1 2       6 3 0
 * 3 4 5  -->  7 4 1
 * 6 7 8       8 5 2
 * 
 * 0 1 2 3    C 8 4 0
 * 4 5 6 7    D 9 5 1
 * 8 9 A B    E A 6 2
 * C D E F    F B 7 3
 */
void rotateMatrix(vector<vector<int>> &nums, int length) {
    assert(nums.size() == length);
    for (int i=0;i<length;i++) {
        assert(nums[i].size() == length);
    }
    for (int i=0;i<length/2;i++) {
        for (int j=0+i;j<length-1-i;j++) {
            int temp = nums[i][j];
            nums[i][j] = nums[length-j-1][i];
            nums[length-j-1][i] = nums[length-i-1][length-j-1];
            nums[length-i-1][length-j-1] = nums[j][length-i-1];
            nums[j][length-i-1] = temp;
        }
    }
}

int main() {
    int M, N;
    scanf("%d\n", &M);
    vector<vector<int>> nums(M);
    for (int i=0;i<M;i++) {
        nums[i].resize(M);
    }
    for (int i=0;i<M;i++) {
        for (int j=0;j<M;j++) {
            scanf("%d", &nums[i][j]);
        }
    }
    rotateMatrix(nums, M);
    for (int i=0;i<M;i++) {
        for (int j=0;j<M;j++) {
            printf("%d ", nums[i][j]);
            if (j == M - 1) {
                printf("\n");
            } 
        }
    }
    return 0;
}
