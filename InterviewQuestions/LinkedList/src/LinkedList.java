/**
 * Created by junchao on 9/11/2014.
 */
public class LinkedList {

    /**
     * Problem description: delete a node given only access to that node
     *                      pre-condition: the node is not a tail node
     * @param n
     * @throws Exception
     */
    public static void deleteGivenNode(Node n) throws Exception {
        if (n == null) {
            return;
        }
        if (n.next == null) {
            throw new Exception("cannot delete a tail node");
        }
        n.data = n.next.data;
        n.next = n.next.next;
    }
}
