import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 * Created by junchao on 9/15/2014.
 */
public class Tree {

    /**
     * e.g.        1
     *          2     3
     *        4   5     6
     *      7
     *       8
     *     preorder: 1 2 4 7 8 5 3 6
     *     inorder : 7 8 4 2 5 1 3 6
     * Parameters should be in same length and contain same numbers(order may be different)
     * Also numbers should be different
     * @param preorder
     * @param inorder
     */
    private static int preIdx = 0;
    static TreeNode constructFromPreorderAndInorder(int preorder[], int inorder[], int inStart, int inEnd) {
        if (inStart > inEnd) {
            return null;
        }
        TreeNode tempRoot = new TreeNode(preorder[preIdx]);
        int inIdx = findValueInArray(preorder[preIdx], inorder);
        preIdx++;
        tempRoot.left = constructFromPreorderAndInorder(preorder, inorder, inStart, inIdx - 1);
        tempRoot.right = constructFromPreorderAndInorder(preorder, inorder, inIdx + 1, inEnd);
        return tempRoot;
    }

    private static int findValueInArray(int value, int arr[]) {
        for (int i=0;i<arr.length;i++) {
            if (arr[i] == value) {
                return i;
            }
        }

        return -1;
    }

    public static List<List<Integer>> generateLevelOrderTraversal(TreeNode root) {
        List<List<Integer>> results = new ArrayList<List<Integer>>();
        doLevelOrderTraversal(root, results);
        return results;
    }

    private static void doLevelOrderTraversal(TreeNode root, List<List<Integer>> results) {
        if (root == null) {
            return;
        }
        Queue<TreeNode> q = new LinkedList<TreeNode>();
        Queue<Integer> currentLevels = new LinkedList<Integer>();
        q.add(root);
        currentLevels.add(0);
        while (!q.isEmpty()) {
            TreeNode current = q.remove();
            int level = currentLevels.remove();
            if (results.size() <= level) {
                results.add(new LinkedList<Integer>());
            }
            results.get(level).add(current.value);
            if (current.left != null) {
                q.add(current.left);
                currentLevels.add(level + 1);
            }
            if (current.right != null) {
                q.add(current.right);
                currentLevels.add(level + 1);
            }
        }
    }

    static void generatePreorderTraversal(TreeNode root, List<Integer> results) {
        if (root == null) {
            return;
        }
        results.add(root.value);
        generatePreorderTraversal(root.left, results);
        generatePreorderTraversal(root.right, results);
    }

    static void generateInorderTraversal(TreeNode root, List<Integer> results) {
        if (root == null) {
            return;
        }
        generateInorderTraversal(root.left, results);
        results.add(root.value);
        generateInorderTraversal(root.right, results);
    }
}
