/**
 * look at the problem statement here:
 * https://www.hackerrank.com/challenges/candies
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;

int getMinimumCandies(vector<int> &nums, vector<int> &candies, int idx) {
    if (candies[idx] != -1) {
        return candies[idx];
    }
    if (idx == 0) {
        if (nums[idx] > nums[idx+1]) {
            candies[idx] = getMinimumCandies(nums, candies, idx+1) + 1;
        } else {
            candies[idx] = 1;
        }
        return candies[idx];
    } else if (idx == nums.size()-1) {
        if (nums[idx] > nums[idx-1]) {
            candies[idx] = getMinimumCandies(nums, candies, idx-1) + 1;
        } else {
            candies[idx] = 1;
        }
        return candies[idx];
    } else {
        if (nums[idx] > nums[idx+1]) {
            candies[idx] = getMinimumCandies(nums, candies, idx+1) + 1;
        }
        if (nums[idx] > nums[idx-1]) {
            int temp = getMinimumCandies(nums, candies, idx-1) + 1;
            candies[idx] = temp > candies[idx] ? temp : candies[idx];
        } 
        if (nums[idx] <= nums[idx-1] && nums[idx] <= nums[idx+1]) {
            candies[idx] = 1;
        }
        return candies[idx];
    }
}

int main() {
    int N;
    scanf("%d", &N);
    vector<int> nums(N);
    vector<int> candies(N);
    for (int i=0;i<N;i++) {
        scanf("%d", &nums[i]);
        candies[i] = -1;
    }
    if (N == 1) {
        printf("1\n");
    } else {
        int result = 0;
        for (int i=0;i<N;i++) {
            result += getMinimumCandies(nums, candies, i);
        }
        printf("%d\n", result);
    }
    return 0;
}

