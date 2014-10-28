/**
John has discovered various rocks. Each rock is composed of various elements, and each element is represented 
by a lowercase latin letter from 'a' to 'z'. An element can be present multiple times in a rock. An element is 
called a 'gem-element' if it occurs at least once in each of the rocks.

Given the list of N rocks with their compositions, display the number of gem-elements that exist in those rocks.

Input Format 
The first line consists of N, the number of rocks. 
Each of the next N lines contain rocks' composition. Each composition consists of lowercase letters of English alphabet.

Output Format 
Print the number of gem-elements that are common in these rocks.

Credit: hackerrank
 */
#include <iostream>
#include <string>

const int NUM_OF_ELEMS = 26;

using namespace std;

void processNthRock(int *elems, string str) {
    int length = str.length();
    bool incremented[NUM_OF_ELEMS] = {};
    for (int i=0; i<NUM_OF_ELEMS; i++) {
        incremented[i] = false;
    }
    for (int i=0; i<length; i++) {
        int num = str[i] - 'a';
        if (!incremented[num]) {
            elems[num]++;
            incremented[num] = true;
        }
    }
}

int main() {
    int numOfLines = 0;
    int elems[NUM_OF_ELEMS] = {};
    string str = "";

    for (int i=0; i<NUM_OF_ELEMS; i++) {
        elems[i] = 0;
    }

    cin >> numOfLines;

    getline(cin, str);
    for (int i=0; i<numOfLines; i++) {
        getline(cin, str);
        processNthRock(elems, str);
    }

    int numOfCommon = 0;
    for (int i=0; i<NUM_OF_ELEMS; i++) {
        if (elems[i] >= numOfLines) {
            numOfCommon++;
        }
    }

    cout << numOfCommon << endl;

    return 0;
}
