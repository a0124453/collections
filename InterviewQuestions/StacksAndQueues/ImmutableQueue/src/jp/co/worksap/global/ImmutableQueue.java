package jp.co.worksap.global;
import java.util.NoSuchElementException;
/**
 * The Queue class represents an immutable first-in-first-out (FIFO) queue of objects.
 * @param <E>
 */
public class ImmutableQueue<E> {
    private ListNode<E> _head = null;
    private ListNode<E> _tail = null;
    private int _size = 0;
    /**
     * requires default constructor.
     */
    public ImmutableQueue() {
        // modify this constructor if necessary, but do not remove default constructor
    }
    // add other constructors if necessary
    /**
     * Returns the queue that adds an item into the tail of this queue without modifying this queue.
     * <pre>
     * e.g.
     * When this queue represents the queue (2, 1, 2, 2, 6) and we enqueue the value 4 into this queue,
     * this method returns a new queue (2, 1, 2, 2, 6, 4)
     * and this object still represents the queue (2, 1, 2, 2, 6) .
     * </pre>
     * If the element e is null, throws IllegalArgumentException.
     * @param e
     * @return
     * @throws IllegalArgumentException
     */
    public ImmutableQueue<E> enqueue(E e) {
        checkElem(e);
        ImmutableQueue<E> queue = new ImmutableQueue<E>();
        if (this.isEmpty()) {  // just create a list of 1 node
            ListNode<E> ln = new ListNode<E>(e);
            queue._head = ln;
            queue._tail = ln;
        } else if (this._tail.next == null) {  // just append the node to the list
            ListNode<E> ln = new ListNode<E>(e);
            queue._head = this._head;
            this._tail.next = ln;
            queue._tail = ln;
        } else {
            ListNode<E> runner = this._head;
            while (runner != this._tail.next) {
                queue = queue.enqueue((E)runner.elem);
                runner = runner.next;
            }
            queue = queue.enqueue(e);
        }
        queue._size = this._size + 1;
        return queue;
    }
    /**
     * Returns the queue that removes the object at the head of this queue without modifying this queue.
     * <pre>
     * e.g.
     * When this queue represents the queue (7, 1, 3, 3, 5, 1) ,
     * this method returns a new queue (1, 3, 3, 5, 1)
     * and this object still represents the queue (7, 1, 3, 3, 5, 1) .
     * </pre>
     * If this queue is empty, throws java.util.NoSuchElementException.
     * @return
     * @throws java.util.NoSuchElementException
     */
    public ImmutableQueue<E> dequeue() {
        checkInvariant();
        ImmutableQueue<E> queue = new ImmutableQueue<E>();
        queue._head = this._head.next;
        queue._tail = this._tail;
        queue._size = this._size - 1;
        return queue;
    }
    /**
     * Looks at the object which is the head of this queue without removing it from the queue.
     * <pre>
     * e.g.
     * When this queue represents the queue (7, 1, 3, 3, 5, 1),
     * this method returns 7 and this object still represents the queue (7, 1, 3, 3, 5, 1)
     * </pre>
     * If the queue is empty, throws java.util.NoSuchElementException.
     * @return
     * @throws java.util.NoSuchElementException
     */
    public E peek() {
        checkInvariant();
        return (E)this._head.elem;
    }
    /**
     * Returns the number of objects in this queue.
     * @return
     */
    public int size() {
        return this._size;
    }

    /**
     * Check for elem passed in
     * @param e
     */
    private void checkElem(E e) {
        if (e == null) {
            throw new IllegalArgumentException("Null element is passed in");
        }
    }
    /**
     * Check for the invariant of the queue
     */
    private void checkInvariant() {
        if (this.isEmpty()) {
            throw new NoSuchElementException("The queue is empty");
        }
    }

    /**
     * Returns whether the current queue is empty or not
     * @return
     */
    public boolean isEmpty() {
        return ((this._head == null && this._tail == null)
                  || (this._tail != null && this._tail.next == this._head));
    }
}

class ListNode<E> {
    Object elem = null;
    ListNode<E> next = null;
    public ListNode() {
    }
    public ListNode(E e) {
        this.elem = e;
    }
}
