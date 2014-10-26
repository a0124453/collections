/**
 * Created by junchao on 10/2/2014.
 * For simplicity's sake, equals and hashCode methods are not implemented. use == instead
 */
public class GraphEdge implements Comparable<GraphEdge> {
    GraphNode neighbor;
    int length;
    public GraphEdge(GraphNode neighbor, int length) {
        assert(neighbor != null);
        assert(length >= 0);
        this.neighbor = neighbor;
        this.length = length;
    }

    @Override
    public int compareTo(GraphEdge o) {
        return this.length - o.length;
    }
}
