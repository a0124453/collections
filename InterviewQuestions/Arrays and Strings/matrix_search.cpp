#include <cassert>
#include <iostream>
#include <vector>

using namespace std;

const int COL_OF_MATRIX = 4;
const int ROW_OF_MATRIX = 4;

bool findNumberInMatrix(const vector<vector<int>> &matrix, int rowNum, int colNum, int number) {
    int row = 0;
    int col = colNum - 1;
    bool foundResult = false;

    while (row < rowNum && col >= 0) {
        int currentNumber = matrix[row][col];
        if (currentNumber == number) {
            foundResult = true;
            break;
        } else if (currentNumber > number) {
            col--;
        } else {
            row++;
        }
    }

    return foundResult;
}

bool findNumberInMatrix(int *matrix, int rowNum, int colNum, int number) {
    int row = 0;
    int col = colNum - 1;
    bool foundResult = false;

    while (row < rowNum && col >= 0) {
        int currentNumber = matrix[row * colNum + col];
        if (currentNumber == number) {
            foundResult = true;
            break;
        } else if (currentNumber > number) {
            col--;
        } else {
            row++;
        }
    }

    return foundResult;
}

int main(int argc, char const *argv[]){
    int matrixArr[ROW_OF_MATRIX][COL_OF_MATRIX] = {{1, 2, 8, 9}, {2, 4, 9 ,12}, 
    {4, 7, 10, 13}, {6, 8, 11, 15}};

    vector<vector<int>> matrix(ROW_OF_MATRIX);
    for (int i=0;i<ROW_OF_MATRIX;i++) {
        for (int j=0;j<COL_OF_MATRIX;j++) {
            matrix[i].push_back(matrixArr[i][j]);
        }
    }

    assert(findNumberInMatrix(matrix, ROW_OF_MATRIX, COL_OF_MATRIX, 7));
    assert(!findNumberInMatrix(matrix, ROW_OF_MATRIX, COL_OF_MATRIX, 5));

    assert(findNumberInMatrix(matrixArr[0], ROW_OF_MATRIX, COL_OF_MATRIX, 7));
    assert(!findNumberInMatrix(matrixArr[0], ROW_OF_MATRIX, COL_OF_MATRIX, 5));
    cout << "Searching done\n";

    return 0;
}
