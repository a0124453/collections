import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.util.Set;

import static org.testng.Assert.*;

public class CombinationTest {

    @BeforeMethod
    public void setUp() throws Exception {
        System.out.println("CombinationTest starts");
    }

    @AfterMethod
    public void tearDown() throws Exception {
        System.out.println("CombinationTest finishes");
    }

    @Test
    public void testGenerateCombinations() throws Exception {
        Set<String> results = Combination.generateCombinations("abcd");

        assertEquals(results.size(), 15);
        assertTrue(results.contains("a"));
        assertTrue(results.contains("b"));
        assertTrue(results.contains("c"));
        assertTrue(results.contains("d"));
        assertTrue(results.contains("ab"));
        assertTrue(results.contains("ac"));
        assertTrue(results.contains("ad"));
        assertTrue(results.contains("bc"));
        assertTrue(results.contains("bd"));
        assertTrue(results.contains("cd"));
        assertTrue(results.contains("abc"));
        assertTrue(results.contains("abd"));
        assertTrue(results.contains("acd"));
        assertTrue(results.contains("bcd"));
        assertTrue(results.contains("abcd"));

        results = Combination.generateCombinations("acbd");
        assertEquals(15, results.size());
    }
}