import java.util.ArrayList;
import java.util.List;

/**
 * Created by junchao on 10/2/2014.
 * For simplicity's sake, equals and hashCode methods are not implemented. use == instead
 */
public class GraphNode {
    int value;
    List<GraphEdge> connections;

    public GraphNode(int value) {
        this.value = value;
        this.connections = new ArrayList<GraphEdge>();
    }

    public void addConnection(GraphEdge e) {
        assert(e != null);
        this.connections.add(e);
    }

    public boolean isDirectNeighbor(GraphNode node) {
        if (node == null) {
            return false;
        }
        for (GraphEdge e : this.connections) {
            if (node == e.neighbor) {
                return true;
            }
        }
        return false;
    }
}
