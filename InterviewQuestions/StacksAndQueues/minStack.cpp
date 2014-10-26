#include <stack>
#include <iostream>
#include <cassert>
#include <climits>

using namespace std;

/**
 * This class will not only behave like a normal stakc but also have another
 * method called findMin which will return the minimum value of all values in 
 * stack
 */
class Stack {
private:
	stack<int> _mainStk;
	stack<int> _minStk;

public:
	Stack() {
		_mainStk = stack<int>();
		_minStk = stack<int>();
	}

	~Stack() {}

	void push(int elem) {
		_mainStk.push(elem);
		if (_minStk.empty()) {
			_minStk.push(elem);
			return;
		} else {
			int currentMin = _minStk.top();
			if (elem < currentMin) {
				_minStk.push(elem);
			}
		}
	}

	void pop() {
		int currentTop = _mainStk.top();
		int currentMin = _minStk.top();
		if (currentTop == currentMin) {
			_minStk.pop();
			_mainStk.pop();
		} else {
			_mainStk.pop();
		}
	}

	int top() {
		return _mainStk.top();
	}

	int findMin() {
		if (_minStk.empty()) {
			return INT_MIN;
		}
		return _minStk.top();
	}
};

int main() {
	Stack stk = Stack();
	stk.push(0);
	stk.push(1);
	assert(0 == stk.findMin());
	assert(1 == stk.top());
	stk.push(-1);
	assert(-1 == stk.findMin());
	assert(-1 == stk.top());
	stk.pop();
	assert(0 == stk.findMin());
	assert(1 == stk.top());
	stk.pop();
	assert(0 == stk.findMin());
	assert(0 == stk.top());
	stk.pop();
	assert(INT_MIN == stk.findMin());

	stk.push(0);
	stk.push(-1);
	stk.push(-3);
	stk.push(4);
	stk.push(5);
	stk.push(-10);
	stk.push(12);
	assert(-10 == stk.findMin());
	assert(12 == stk.top());
	stk.pop();
	assert(-10 == stk.findMin());
	assert(-10 == stk.top());
	stk.pop();
	stk.pop();
	assert(-3 == stk.findMin());
	assert(4 == stk.top());

	return 0;
}
