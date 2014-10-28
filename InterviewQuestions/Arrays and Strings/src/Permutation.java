import java.util.HashSet;
import java.util.Set;

/**
 * Created by junchao on 7/19/2014.
 */
public class Permutation {

    private static Set<String> generatePermutationsOfString(String inputStr, int index) {
        if (index == inputStr.length() - 1) {
            HashSet<String> results = new HashSet<String>();
            results.add(inputStr.substring(index));
            return results;
        } else {
            Set<String> tempResults = generatePermutationsOfString(inputStr, index + 1);
            HashSet<String> results = new HashSet<String>();
            for (String str : tempResults) {
                for (int i=0; i<str.length();i++) {
                    String insertedStr = str.substring(0, i) +
                            inputStr.substring(index, index + 1) + str.substring(i, str.length());
                    results.add(insertedStr);
                }
                results.add(str + inputStr.substring(index, index + 1));
            }
            return results;
        }
    }

    /**
     * input str should be not null and not empty, contains all uniqueue characters
     *
     * @param str
     * @return
     */
    public static Set<String> generatePermutations(String str) {
        Set<String> results = generatePermutationsOfString(str, 0);

        return results;
    }
}
