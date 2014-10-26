import java.util.*;

/**
 * Created by junchao on 10/2/2014.
 */
public class Graph {
    static public boolean isPathExists(GraphNode src, GraphNode dest) {
        if (src == null || dest == null) {
            return false;
        }
        Queue<GraphNode> nodeQueue = new LinkedList<GraphNode>();
        HashSet<GraphNode> visited = new HashSet<GraphNode>();  // this is dangerous DS to use here.
                                                                // for simplicity's sake, we will go with this
        nodeQueue.add(src);
        visited.add(src);

        while (!nodeQueue.isEmpty()) {
            GraphNode current = nodeQueue.remove();
            for (GraphEdge e : current.connections) {
                if (e.neighbor == dest) {
                    return true;
                }
                if (!visited.contains(e.neighbor)) {
                    nodeQueue.add(e.neighbor);
                    visited.add(e.neighbor);
                }
            }
        }

        return false;
    }

    /**
     * negelect back edge in directed graph, undirected graph
     *   e.g. 3 -> 4, 4 -> 3 are not cycle
     * @param node
     * @return
     */
    static public boolean isCycleExists(GraphNode node) {
        if (node == null) {
            return false;
        }
        Stack<GraphNode> stk = new Stack<GraphNode>();
        HashSet<GraphNode> visited = new HashSet<GraphNode>();
        HashSet<GraphEdge> explored = new HashSet<GraphEdge>();
        stk.push(node);
        visited.add(node);
        while (!stk.isEmpty()) {
            GraphNode current = stk.pop();
            for (GraphEdge e : current.connections) {
                if (!explored.contains(e) &&
                        (visited.contains(e.neighbor) && !e.neighbor.isDirectNeighbor(current))) {
                    return true;
                }
                if (!visited.contains(e.neighbor)) {
                    stk.push(e.neighbor);
                    visited.add(e.neighbor);
                    explored.add(e);
                }
            }
        }

        return false;
    }

    // TODO: do a topo sort for the whole connection component
    static public List<GraphNode> toposort(GraphNode node) {
        List<GraphNode> order = new ArrayList<GraphNode>();
        if (node == null) {
            return order;
        }
        Stack<GraphNode> stk = new Stack<GraphNode>();
        HashSet<GraphNode> visited = new HashSet<GraphNode>();
        stk.push(node);
        visited.add(node);
        while (!stk.isEmpty()) {
            GraphNode current = stk.pop();
            order.add(current);
            for (GraphEdge e : current.connections) {
                if (!visited.contains(e.neighbor)) {
                    stk.push(e.neighbor);
                    visited.add(e.neighbor);
                }
            }
        }

        return order;
    }

    static int sumOfWeightOfMinimumSpanningTreeEdges(GraphNode node) {
        if (node == null) {
            return 0;
        }
        int sumOfWeight = 0;
        PriorityQueue<GraphEdge> pq = new PriorityQueue<GraphEdge>();
        HashSet<GraphNode> visited = new HashSet<GraphNode>();
        for (GraphEdge e : node.connections) {
            pq.add(e);
        }
        visited.add(node);
        while (!pq.isEmpty()) {
            GraphEdge edge = pq.remove();
            if (!visited.contains(edge.neighbor)) {
                visited.add(edge.neighbor);
                sumOfWeight += edge.length;
                for (GraphEdge e : edge.neighbor.connections) {
                    pq.add(e);
                }
            }
        }

        return sumOfWeight;
    }

    // TODO: add Dijkstra's algo method

    // TODO: A star

    // TODO: longest path on DAG
}
