package general;

import com.intuit.karate.junit5.Karate;

public class karateRunner {
    @Karate.Test
    Karate testSample() {
        return Karate.run("classpath:general").tags("@basicAuth");
    }
}
