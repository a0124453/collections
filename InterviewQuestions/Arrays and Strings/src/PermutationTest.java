import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import java.util.Set;

import static org.testng.Assert.*;

public class PermutationTest {

    @BeforeMethod
    public void setUp() throws Exception {

    }

    @AfterMethod
    public void tearDown() throws Exception {

    }

    @Test
    public void testGeneratePermutations() throws Exception {
        Set<String> results = Permutation.generatePermutations("abc");

        assertEquals(results.size(), 6);
        assertTrue(results.contains("cab"));
        assertTrue(results.contains("abc"));
        assertTrue(results.contains("cba"));
        assertTrue(results.contains("bca"));
        assertTrue(results.contains("bac"));
        assertTrue(results.contains("acb"));

        results = Permutation.generatePermutations("abcd");

        assertEquals(results.size(), 24);
    }
}