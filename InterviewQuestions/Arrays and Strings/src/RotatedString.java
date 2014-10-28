/**
 * Created by junchao on 9/11/2014.
 */
public class RotatedString {
    public static boolean isStringRotated(String str1, String str2) {
        assert(str1 != null && str2 != null);
        String doubleStr = str1 + str1;
        return isSubString(doubleStr, str2);
    }

    private static boolean isSubString(String str, String sub) {
        return str.contains(sub);
    }
}
