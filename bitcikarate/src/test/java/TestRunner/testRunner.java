package TestRunner;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.*;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class testRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("src/test/java/features/")
                .outputCucumberJson(true)
                .parallel(1);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }




   

}



