#include <string>
#include <iostream>

using namespace std;

/**
 * find patterns of str
 * e.g. ababab --> ab
 *      ababa  --> the str itself
 */
string findPattern(string str) {
    int size = str.size();
    string combined = str + str;
    int pos = combined.substr(1).find(str);
    if (pos + 1 < size - 1) {
        return combined.substr(0, pos + 1);
    } else {
        return str;
    }
}

int main() {
    string str;
    int T;
    cin >> T;
    getline(cin, str);
    while (T--) {
        getline(cin, str);
        cout << findPattern(str) << endl;
    }

    return 0;
}
