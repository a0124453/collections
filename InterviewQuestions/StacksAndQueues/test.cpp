#include <cstdio>
#include <stack>

void towerOfHanoi(char src, char mid, char dest, int size) {
    if (size <= 0) {
        return;
    } else if (size == 1) {
        printf("Move %d from %c to %c\n", size, src, dest);
        return;
    } else {
        towerOfHanoi(src, dest, mid, size - 1);
        printf("Move %d from %c to %c\n", size, src, dest);
        towerOfHanoi(mid, src, dest, size - 1);
        return;
    }
}

// this is the function that we are supposed to implement--but I am stuck here
void hanoiByStack(char src, char mid, char dest, int size) {
    stack<int> srcStk;
    stack<int> midStk;
    stack<int> destStk;
    // starting from src stack
    for (int i=size;i>0;i--) {
        srcStk.push(i);
    }

}

int main() {
    int size;

    printf("Starting Tower of Hanoi: ");
    scanf("%d", &size);
    towerOfHanoi('A', 'B', 'C', size);

    return 0;
}


