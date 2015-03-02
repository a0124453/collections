CS3223 assignment 1
===================================================

* Names:
  Gu Junchao
  Wang Yu

* Highlight of changes:

  ```C
  //CS3223 Array Implemetation of LRU stack(tail-----------head)
  //an array of size NBuffers to record the order of use of different buffers
  static int *LRUstack = NULL;
  ```

  ```C
  // add sizeof(int) * NBuffers to accomodate LRUstack
  Size StrategyShmemSize(void)
  ```

  ```C
  // initialize LRUstack in shared memory if have not done so
  void StrategyInitialize(bool init)
  ```

  ```C
  // C4(delete the buf from LRUstack if it should be freed)
  void StrategyFreeBuffer(volatile BufferDesc *buf)
  ```

  ```C
  // removing all ring(CLOCK) related functions and use LRU instead
  // will handle C2(put the free buf found to the top of LRUstack) and
  // C3(find the buf with refcount == 0 which is closest to tail and update
  // its position to head)
  volatile BufferDesc *StrategyGetBuffer(BufferAccessStrategy strategy, bool *lock_held)
  ```

  ```C
  // the function signature is altered from the original one provided in freelist-lru
  // for better clarity when calling it.
  // basically manipulate the array of buf, LRUstack in this case to keep track of
  // order of use
  void StrategyUpdateAccessedBuffer(int buf_id, int caseNum)
  ```

* Observation
  As it is shown in the results, clock implemention is faster than lru. In fact,
  based on the number of queries processed and transactions per second, clock is
  about 2 times faster than lru. Although 2 methods are both expected to run in
  O(n) time, clock will incur fewer disk access, which is very costly in terms 
  of time, therefore saving much time.
