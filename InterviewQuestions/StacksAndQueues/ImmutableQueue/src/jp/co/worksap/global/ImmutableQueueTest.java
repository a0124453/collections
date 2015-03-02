package jp.co.worksap.global;

import org.junit.Test;

import static org.junit.Assert.*;

public class ImmutableQueueTest {

    @Test
    public void testEnqueue() throws Exception {
        ImmutableQueue<String> q = new ImmutableQueue<String>();
        ImmutableQueue<String> runner = q.enqueue("test begins");
        for (int i = 0;i < 10; i++) {
            runner = runner.enqueue("test " + i);
            assertTrue(runner.size() == (i + 2));
        }
        assertTrue(runner.peek().equals("test begins"));
    }

    @Test
    public void testDequeue() throws Exception {
        ImmutableQueue<String> q = new ImmutableQueue<String>();
        ImmutableQueue<String> runner = q.enqueue("test begins");
        for (int i = 0;i < 10; i++) {
            runner = runner.enqueue("test " + i);
        }
        assertTrue(runner.peek().equals("test begins"));
        for (int i = 0;i < 10; i++) {
            runner = runner.dequeue();
            assertTrue(runner.size() == (10 - i));
            assertTrue(runner.peek().equals("test " + i));
        }
    }
}