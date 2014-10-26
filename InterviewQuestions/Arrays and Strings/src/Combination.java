/**
 * Created by junchao on 7/18/2014.
 */

import java.util.HashSet;
import java.util.Set;

/**
 * Question description: given a string with all unique characters, write a method to output all the possible combinations
 * of characters in the string.
 *     e.g. "abcd" -> {"a", "b", "c", "d", "ab", "ac", "ad", "bc", "bd", "cd", "abc", "abd", "acd", "bcd", "abcd"}
 */
public class Combination {

    /**
     * this method is supposed to be slower than the one follows but it seems to be the most natual one to me
     * explictly, this method use less memory--no temp set needed. however, the extensive recursive function call
     * will take a lot of memory and slow the calculation of results
     *
     * @param inputStr
     * @param index
     * @param tempStr
     * @param results
     */
    private static void generateCombinationsOfString(String inputStr, int index, String tempStr, Set<String> results) {
        if (index == inputStr.length() - 1) {
            if (!tempStr.isEmpty()) {
                results.add(tempStr);
            }
            results.add(tempStr + inputStr.charAt(index));
        } else {
            generateCombinationsOfString(inputStr, index + 1, tempStr, results);
            generateCombinationsOfString(inputStr, index + 1, tempStr + inputStr.charAt(index), results);
        }
    }

    /**
     * another recursive method
     *
     * @param inputStr
     * @param index
     * @param results
     */
    @SuppressWarnings("unused")
    private static void generateCombinationsOfStringAlternative(String inputStr, int index, Set<String> results) {
        if (index == inputStr.length() - 1) {
            HashSet<String> tempResults = new HashSet<String>(results);
            for (String str : tempResults) {
                results.add(str + inputStr.charAt(index));
            }
            results.remove("");
        } else {
            if (index == 0) {
                results.add("");
            }
            HashSet<String> tempResults = new HashSet<String>(results);
            for (String str : tempResults) {
                results.add(str + inputStr.charAt(index));
            }
            generateCombinationsOfStringAlternative(inputStr, index + 1, results);
        }
    }

    /**
     * the input str should contain unique characters only, not null and not empty.
     * also, you can implement assert to make sure of this if you want during the interview. or at least mention that
     * to the interviewer
     *
     * @param str
     * @return
     */
    public static Set<String> generateCombinations(String str) {
        Set<String> results = new HashSet<String>();
        generateCombinationsOfString(str, 0, "", results);
        //generateCombinationsOfStringAlternative(str, 0, results);

        return results;
    }
}

