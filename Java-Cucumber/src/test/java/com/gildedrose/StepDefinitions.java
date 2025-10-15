package com.gildedrose;

import static org.junit.Assert.*;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class StepDefinitions {
    private Item[] items = new Item[1];
    private GildedRose app;

    @Given("The item as {string}")
    public void initial_sellin_is_and_quality_is(String name) {
        initial_sellin_is_and_quality_is(name, 0, 0);
    }

    @Given("The item as {string} with sellIn {int} and quality {int}")
    public void initial_sellin_is_and_quality_is(String name, int sellIn, int quality) {
        items[0] = new Item(name, sellIn, quality);
        app = new GildedRose(items);
    }

    @When("I update the quality")
    public void i_update_the_quality() {
        app.updateQuality();
    }

    @Then("I should get item as {string}")
    public void i_should_get_sellin_as_and_quality_as(String expected) {
        assertEquals(expected, app.items[0].name);
    }

    @Then("I should get item as {string} with sellIn {int} and quality {int}")
    public void i_should_get_sellin_as_and_quality_as(String expectedName, int expectedSellIin, int expectedQuality) {
        assertEquals(expectedName, app.items[0].name);
        assertEquals(expectedSellIin, app.items[0].sellIn);
        assertEquals(expectedQuality, app.items[0].quality);
    }

    @Then("I should get item as {string} with sellIn {int}")
    public void i_should_get_sellin_as(String expectedName, int expectedSellIin) {
        assertEquals(expectedName, app.items[0].name);
        assertEquals(expectedSellIin, app.items[0].sellIn);
    }

    @Then("I should get item as {string} with quality {int}")
    public void i_should_get_quality_as(String expectedName, int expectedQuality) {
        assertEquals(expectedName, app.items[0].name);
        assertEquals(expectedQuality, app.items[0].quality);
    }
}

