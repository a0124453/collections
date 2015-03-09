import junit.framework.TestCase;
import org.testng.annotations.Test;

public class StringConstructionTest extends TestCase {
    @Test
    public void testStringConstruction() {
        assertEquals(1, StringConstruction.stringConstructing("aba", "aba"));
        assertEquals(6, StringConstruction.stringConstructing("aba", "abbaab"));
        assertEquals(3, StringConstruction.stringConstructing("aba", "abaab"));
    }
}