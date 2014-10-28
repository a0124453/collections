import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.List;

public class TreeTest extends TestCase {

    public void testConstructFromPreorderAndInorderAndLevelOrderTraversal() throws Exception {
        int arr1[] = {1, 2, 4, 7, 8, 5, 3, 6};
        int arr2[] = {7, 8, 4, 2, 5, 1, 3, 6};
        TreeNode n = Tree.constructFromPreorderAndInorder(arr1, arr2, 0, 7);
        assertEquals(1, n.value);
        List<Integer> li = new ArrayList<Integer>();
        List<Integer> li2 = new ArrayList<Integer>();
        Tree.generatePreorderTraversal(n, li);
        Tree.generateInorderTraversal(n, li2);
        for (int i=0;i<li.size();i++) {
            assertEquals(arr1[i], li.get(i).intValue());
            assertEquals(arr2[i], li2.get(i).intValue());
        }

        List<List<Integer>> levelOrderTraversal = Tree.generateLevelOrderTraversal(n);
        assertEquals(5, levelOrderTraversal.size());
        assertEquals(1, levelOrderTraversal.get(0).get(0).intValue());
        assertEquals(2, levelOrderTraversal.get(1).get(0).intValue());
        assertEquals(3, levelOrderTraversal.get(1).get(1).intValue());
        assertEquals(4, levelOrderTraversal.get(2).get(0).intValue());
        assertEquals(5, levelOrderTraversal.get(2).get(1).intValue());
        assertEquals(6, levelOrderTraversal.get(2).get(2).intValue());
        assertEquals(7, levelOrderTraversal.get(3).get(0).intValue());
        assertEquals(8, levelOrderTraversal.get(4).get(0).intValue());
    }
}