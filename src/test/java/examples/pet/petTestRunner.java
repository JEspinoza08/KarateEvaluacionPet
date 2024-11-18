package examples.pet;

import com.intuit.karate.junit5.Karate;
public class petTestRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("pet").relativeTo(getClass());
    }
}
