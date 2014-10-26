/**
 * Question description: reverse the order of words in a sentence.
 *   e.g.: "this is a sentence." --> "sentence. a is this"
 */
public class WordReverse {
    public static String reverseWord(String inputStr) {
        String[] subStrs = inputStr.split(" ");
        StringBuilder builder = new StringBuilder();
        for (int i=subStrs.length-1; i>=0; i--) {
            if (!subStrs[i].isEmpty()) {
                builder.append(subStrs[i] + " ");
            }
        }
        if (builder.length() != 0) {
            builder.deleteCharAt(builder.length() - 1);
        }
        return builder.toString();
    }
}

/**
 * PS.:
 *   Using Java,JavaScript and etc. should be fairly straight forward. Even if we are asked to to use C/C++, it is easy
 *   to write a working solution. However, it is possible to save buffer during reverss process. It goes like this:
 *   first pass, reverse the whole string "this is a sentence." --> ".ecnetnes a si siht"
 *   second pass, reverse order of characters in a word ".ecnetnes a si siht" --> "sentence. a is this"
 */
