#include <cstdio>
#include <stack>
#include <cassert>

using namespace std;

class MyQueue {
private:
    stack<int> *_stk1;
    stack<int> *_stk2;
public:
    MyQueue() {
        _stk1 = new stack<int>();
        _stk2 = new stack<int>();
    }

    ~MyQueue() {
        delete _stk1;
        delete _stk2;
    }

    void enqueue(int elem) {
        while (!_stk2->empty()) {
            _stk1->push(_stk2->top());
            _stk2->pop();
        }
        _stk1->push(elem);
    }

    int peek() {
        while (!_stk1->empty()) {
            _stk2->push(_stk1->top());
            _stk1->pop();
        }
        return _stk2->top();
    }

    void dequeue() {
        while (!_stk1->empty()) {
            _stk2->push(_stk1->top());
            _stk1->pop();
        }
        _stk2->pop();
    }
};

int main() {
    MyQueue mq = MyQueue();
    mq.enqueue(1);
    mq.enqueue(2);
    mq.enqueue(3);
    assert(mq.peek() == 1);
    mq.dequeue();
    assert(mq.peek() == 2);
    mq.dequeue();
    assert(mq.peek() == 3);
    mq.enqueue(4);
    mq.enqueue(5);
    assert(mq.peek() == 3);
    mq.dequeue();
    assert(mq.peek() == 4);
    mq.dequeue();
    assert(mq.peek() == 5);

    return 0;
}
