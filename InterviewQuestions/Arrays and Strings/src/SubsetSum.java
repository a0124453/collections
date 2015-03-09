import java.util.Arrays;
import java.util.HashSet;

/**
 * This is the subset sum problem.
 * Given a set of signed integers, return True if there is a non-empty subset
 * whose sum is zero and False otherwise.
 * Constraints: - the list has at most 30 elements:
 * 0 < |L| <= 30 - each element n: -100 <= n <= 100
 * Examples: L = [-3, -7, -2, 5, 8] -> True (because [-3, -2, 5] sums to zero)
 * L = [-4, -7, 10, 6, 8] -> False
 */
public class SubsetSum {
    public static boolean subsetSum(int[] L) {
        Arrays.sort(L);
        HashSet<Integer> negatives = new HashSet<Integer>();
        HashSet<Integer> nonNegatives = new HashSet<Integer>();
        int indexOfSeparation = 0;
        for (int i = 1; i < L.length; i++) {
            if (L[i - 1] < 0 && L[i] >= 0) {
                indexOfSeparation = i;
                break;
            }
        }
        for (int i = 0; i < indexOfSeparation; i++) {
            // generate all combinations for negative numbers and put abs of sums into set
        }
        for (int i = indexOfSeparation; i < L.length; i++) {
            // generate all combinations for non-negative numbers and put abs of sums into set
        }
        // if two set share no common elements, return false; else true
        return false;
    }

    public static boolean subsetSumAlternative(int[] L) {
        int s,x,Q = 3000, f[][] = new int [31][2*Q];
        for (x=0;x<L.length; ++x){
            f[x+1][L[x]+Q] = 1;
            for (s=2*Q; --s!=0;)
                if (f[x][s]==1)
                    f[x+1][s] = f[x+1][s+L[x]] = 1;
            if (f[x+1][Q]==1) return true;
        }
        return false;
    }
}
