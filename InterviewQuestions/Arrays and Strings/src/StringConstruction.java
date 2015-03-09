/**
 * Starting with an empty string we can do the following two operations:
 * - append the given string A to the end of the current string.
 * - erase one symbol of the current string.
 * What is the least number of operations needed to construct the given string S?
 * Assume that all the letters from S appear in A at least once.
 * Example:  A = "aba" S = "abbaab"
 * Coinstruction: "" -> "aba" -> "ab" -> "ababa" -> "abba" -> "abbaaba" -> "abbaab".
 * The answer is 6.
 */
public class StringConstruction {
    public static int stringConstructing(String a, String s) {
        String result = "";
        int numberOfOps = 0;
        while (!result.equals(s)) {
            if (result.length() <= s.length() && result.equals(s.substring(0, result.length()))) {
                result += a;
            } else {
                for (int i = 0; i < result.length(); i++) {
                    if (i >= s.length() || result.charAt(i) != s.charAt(i)) {
                        result = result.substring(0, i) + result.substring(i+1);
                        break;
                    }
                }
            }
            numberOfOps++;
        }
        return numberOfOps;
    }
}
