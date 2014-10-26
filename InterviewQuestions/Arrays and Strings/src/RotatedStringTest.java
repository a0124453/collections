import junit.framework.TestCase;

public class RotatedStringTest extends TestCase {

    public void testIsStringRotated() throws Exception {
        assertTrue(RotatedString.isStringRotated("abc", "cab"));
        assertFalse(RotatedString.isStringRotated("abc", "cba"));
        assertTrue(RotatedString.isStringRotated("this is test ", "test this is "));
        assertFalse(RotatedString.isStringRotated("this is test ", "test is this "));
    }
}