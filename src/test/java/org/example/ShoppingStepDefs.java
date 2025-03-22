package org.example;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.stream.Collectors;

import static org.junit.jupiter.api.Assertions.*;

public class ShoppingStepDefs extends AbstractStepDefs {

    @Given("the {string} is added to the cart")
    public void somethingIsAddedToTheCart(String item) {
        homePage.addItemToCart(item);
    }

    @Then("the price should read {string}")
    public void thePriceShouldRead(String total) {
        assertEquals(total, homePage.getTotal());
    }

    @Then("the {string} is displayed")
    public void thePriceIsDisplayed(String price) {
        assertEquals(price, homePage.getPrice());
    }


    @Given("the filter is set to {string}")
    public void theFilterIsSetTo(String filterOption) {
        WebElement filterDropdown = driver.findElement(By.className("product_sort_container"));
        filterDropdown.click();
        filterDropdown.findElement(By.xpath("//option[text()='" + filterOption + "']")).click();
    }

    @Then("the products should be sorted by price in ascending order")
    public void theProductsShouldBeSortedByPriceInAscendingOrder() {
        List<WebElement> prices = driver.findElements(By.className("inventory_item_price"));
        List<Double> priceValues = prices.stream()
                .map(price -> Double.parseDouble(price.getText().replace("$", "")))
                .collect(Collectors.toList());
        assertTrue(isSorted(priceValues, true));
    }

    @Then("the products should be sorted by price in descending order")
    public void theProductsShouldBeSortedByPriceInDescendingOrder() {
        List<WebElement> prices = driver.findElements(By.className("inventory_item_price"));
        List<Double> priceValues = prices.stream()
                .map(price -> Double.parseDouble(price.getText().replace("$", "")))
                .collect(Collectors.toList());
        assertTrue(isSorted(priceValues, false));
    }

    @Then("the products should be sorted by name in ascending order")
    public void theProductsShouldBeSortedByNameInAscendingOrder() {
        List<WebElement> names = driver.findElements(By.className("inventory_item_name"));
        List<String> nameValues = names.stream()
                .map(WebElement::getText)
                .collect(Collectors.toList());
        assertTrue(isSorted(nameValues, true));
    }

    @Then("the products should be sorted by name in descending order")
    public void theProductsShouldBeSortedByNameInDescendingOrder() {
        List<WebElement> names = driver.findElements(By.className("inventory_item_name"));
        List<String> nameValues = names.stream()
                .map(WebElement::getText)
                .collect(Collectors.toList());
        assertTrue(isSorted(nameValues, false));
    }

    private <T extends Comparable<T>> boolean isSorted(List<T> list, boolean ascending) {
        for (int i = 1; i < list.size(); i++) {
            if (ascending && list.get(i).compareTo(list.get(i - 1)) < 0) {
                return false;
            } else if (!ascending && list.get(i).compareTo(list.get(i - 1)) > 0) {
                return false;
            }
        }
        return true;
    }



    @And("the {string} is removed from the cart")
    public void theItemIsRemovedFromTheCart(String item) {
        homePage.removeItemFromCart(item);
    }


    @Then("the {string} should not be in the cart")
    public void theItemShouldNotBeInTheCart(String item) {
        assertFalse(homePage.isItemInCart(item));
    }


    @And("the {string} should be in the cart")
    public void theItemShouldBeInTheCart(String item) {
        assertTrue(homePage.isItemInCart(item));
    }
}