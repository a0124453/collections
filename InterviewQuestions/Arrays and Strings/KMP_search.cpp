#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector<int> preprocess(string pat) {
    vector<int> lps(pat.size());
    int indicator = 0;
    int runner = 1;
    int size = pat.size();
    if (size  <= 1) {
        lps[0] = 0;
        return lps;
    }
    while (runner < size) {
        if (pat[runner] == pat[indicator]) {
            indicator++;
            lps[runner] = indicator;
            runner++;
        } else {
            if (indicator == 0) {
                lps[runner] = 0;
                runner++;
            } else {
                indicator = lps[indicator - 1];
            }
        }
    }

    return lps;
}

int KMPFind(string str, string pattern) {
    vector<int> nextTable = preprocess(pattern);
    int size = str.size();
    int patternSize = pattern.size();
    int idx = 0;
    int patIdx = 0;

    while (idx < size) {
        if (str[idx] == pattern[patIdx]) {
            idx++;
            patIdx++;
        } else {
            if (patIdx ==0) {
                idx++;
            } else {
                patIdx = nextTable[patIdx - 1];
            }
        }
        if (patIdx == patternSize - 1) {
            return idx - patternSize;
        }
    }

    return -1;
}

int main() {
    string str, pattern;
    getline(cin, str);
    getline(cin, pattern);
    cout << KMPFind(str, pattern) << endl;

    return 0;
}
