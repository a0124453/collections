import junit.framework.TestCase;

import java.util.List;

public class GraphTest extends TestCase {

    /**
     * 0 -> 1 <- 2              8 <-> 9
     *      <    <              <
     *      |    |              |
     *      >                   >
     *      3 -> 4 -> 5    6 <-> 7  <-> 10
     * only this general direct graph is tested. cases of undirected and tree are omitted
     * @throws Exception
     */
    public void testIsPathExistsIsCycleExists() throws Exception {
        GraphNode n0 = new GraphNode(0);
        GraphNode n1 = new GraphNode(1);
        GraphNode n2 = new GraphNode(2);
        GraphNode n3 = new GraphNode(3);
        GraphNode n4 = new GraphNode(4);
        GraphNode n5 = new GraphNode(5);
        GraphNode n6 = new GraphNode(6);
        GraphNode n7 = new GraphNode(7);
        GraphNode n8 = new GraphNode(8);
        GraphNode n9 = new GraphNode(9);
        GraphNode n10 = new GraphNode(10);
        GraphEdge e01 = new GraphEdge(n1, 1);
        GraphEdge e21 = new GraphEdge(n1, 2);
        GraphEdge e13 = new GraphEdge(n3, 3);
        GraphEdge e31 = new GraphEdge(n1, 3);
        GraphEdge e42 = new GraphEdge(n2, 5);
        GraphEdge e34 = new GraphEdge(n4, 4);
        GraphEdge e45 = new GraphEdge(n5, 7);
        GraphEdge e67 = new GraphEdge(n7, 1);
        GraphEdge e76 = new GraphEdge(n6, 1);
        GraphEdge e78 = new GraphEdge(n8, 2);
        GraphEdge e87 = new GraphEdge(n7, 2);
        GraphEdge e89 = new GraphEdge(n9, 3);
        GraphEdge e98 = new GraphEdge(n8, 3);
        GraphEdge e7a = new GraphEdge(n10, 4);
        GraphEdge ea7 = new GraphEdge(n7, 4);

        n0.addConnection(e01);
        n1.addConnection(e13);
        n2.addConnection(e21);
        n3.addConnection(e31);
        n3.addConnection(e34);
        n4.addConnection(e42);
        n4.addConnection(e45);
        n6.addConnection(e67);
        n7.addConnection(e76);
        n7.addConnection(e7a);
        n7.addConnection(e78);
        n8.addConnection(e87);
        n8.addConnection(e89);
        n9.addConnection(e98);
        n10.addConnection(ea7);

        assertFalse(Graph.isPathExists(null, n0));
        assertFalse(Graph.isPathExists(n1, null));
        assertTrue(Graph.isPathExists(n1, n5));
        assertTrue(Graph.isPathExists(n1, n2));
        assertFalse(Graph.isPathExists(n0, n6));

        assertFalse(Graph.isCycleExists(null));
        assertFalse(Graph.isCycleExists(n7));
        assertFalse(Graph.isCycleExists(n10));
        assertFalse(Graph.isCycleExists(n8));
        assertFalse(Graph.isCycleExists(n5));
        assertTrue(Graph.isCycleExists(n0));
        assertTrue(Graph.isCycleExists(n1));
        assertTrue(Graph.isCycleExists(n3));
        assertTrue(Graph.isCycleExists(n4));

        List<GraphNode> order = Graph.toposort(n3);
        assertEquals(5, order.size());
        assertEquals(3, order.get(0).value);
        assertEquals(4, order.get(1).value);
        assertEquals(5, order.get(2).value);
        assertEquals(2, order.get(3).value);
        assertEquals(1, order.get(4).value);
        assertEquals(10, Graph.sumOfWeightOfMinimumSpanningTreeEdges(n7));
        assertEquals(10, Graph.sumOfWeightOfMinimumSpanningTreeEdges(n6));
        GraphEdge e9a = new GraphEdge(n10, 1);
        GraphEdge ea9 = new GraphEdge(n7, 1);
        n9.addConnection(e9a);
        n10.addConnection(ea9);
        assertEquals(7, Graph.sumOfWeightOfMinimumSpanningTreeEdges(n7));
        assertEquals(7, Graph.sumOfWeightOfMinimumSpanningTreeEdges(n6));
    }
}