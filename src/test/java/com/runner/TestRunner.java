package com.runner;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;
import org.testng.annotations.DataProvider;

@CucumberOptions(
        features = "src/test/resources/features",
        glue = { "com.test.stepdefs" },
        //tags = "~@ignore",
        plugin = {
                "pretty",
                "html:target/cucumber-reports/cucumber-pretty",
                "json:target/cucumber-reports/json-reports/CucumberTestReport.json",
                "rerun:target/cucumber-reports/rerun-reports/rerun.txt"
        })
public class TestRunner extends AbstractTestNGCucumberTests{

        /*@Override
        @DataProvider(parallel = true)
        public Object[][] scenarios() {
                return super.scenarios();
        }*/

}
