import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import static org.testng.Assert.*;

public class WordReverseTest {

    @BeforeMethod
    public void setUp() throws Exception {

    }

    @Test
    public void testReverseWord() {
        assertEquals(WordReverse.reverseWord(""), "");
        assertEquals(WordReverse.reverseWord("test"), "test");
        assertEquals(WordReverse.reverseWord("one this test"), "test this one");
        assertEquals(WordReverse.reverseWord("one this  test"), "test this one");
    }

    @AfterMethod
    public void tearDown() throws Exception {

    }
}