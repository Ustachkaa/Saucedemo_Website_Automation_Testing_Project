package org.example;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class NavigateStepDefs extends AbstractStepDefs{

    @Then("the user should be directed to {string}")
    public void theUserShouldBeDirectedTo(String url) {
        assertEquals(url, driver.getCurrentUrl());
    }


}
