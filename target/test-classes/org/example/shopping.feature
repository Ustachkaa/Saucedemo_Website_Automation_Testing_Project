# Created by Mariam at 12/16/2024
Feature: Saucedemo Shopping

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

  Scenario: Filter products by price from low to high
    Given the filter is set to 'Price (low to high)'
    Then the products should be sorted by price in ascending order

  Scenario: Filter products by price from high to low
    Given the filter is set to 'Price (high to low)'
    Then the products should be sorted by price in descending order

  Scenario: Filter products by name from A to Z
    Given the filter is set to 'Name (A to Z)'
    Then the products should be sorted by name in ascending order

  Scenario: Filter products by name from Z to A
    Given the filter is set to 'Name (Z to A)'
    Then the products should be sorted by name in descending order

  Scenario Outline: Buying two items
    Given the '<item1>' is added to the cart
    And the '<item2>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipCode>'
    When the 'Continue' button is clicked
    Then the price should read '<total>'
    Then the 'Finish' button is clicked
    Examples:
      | item1                       | item2                             | firstName | lastName | zipCode | total         |
      | Sauce Labs Backpack         | Sauce Labs Bike Light             | Chhinling | Hean     | 4032    | Total: $43.18 |
      | Sauce Labs Bolt T-Shirt     | Sauce Labs Fleece Jacket          | Rane      | Thou     | 1023    | Total: $71.26 |
      | Sauce Labs Onesie           | Test.allTheThings() T-Shirt (Red) | Michael   | Jordan   | 5390    | Total: $25.90 |


  Scenario Outline: Buying one item
    Given the '<item1>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipCode>'
    When the 'Continue' button is clicked
    Then the price should read '<total>'
    Then the 'Finish' button is clicked
    Examples:
      | item1                       | firstName | lastName | zipCode | total         |
      | Sauce Labs Backpack         | Chhinling | Hean     | 4032    | Total: $32.39 |
      | Sauce Labs Bike Light       | Rane      | Thou     | 1023    | Total: $10.79 |
      | Sauce Labs Bolt T-Shirt     | Michael   | Jordan   | 5390    | Total: $17.27 |

  Scenario Outline: Buying three items
    Given the '<item1>' is added to the cart
    And the '<item2>' is added to the cart
    And the '<item3>' is added to the cart
    And the 'Cart' button is clicked
    And the 'Checkout' button is clicked
    And the 'First Name' field is filled with '<firstName>'
    And the 'Last Name' field is filled with '<lastName>'
    And the 'Zip Code' field is filled with '<zipCode>'
    When the 'Continue' button is clicked
    Then the price should read '<total>'
    Then the 'Finish' button is clicked
    Examples:
      | item1                       | item2                             | item3                             | firstName | lastName | zipCode | total         |
      | Sauce Labs Backpack         | Sauce Labs Bike Light             | Sauce Labs Bolt T-Shirt           | Chhinling | Hean     | 4032    | Total: $60.45 |
      | Sauce Labs Bolt T-Shirt     | Sauce Labs Fleece Jacket          | Test.allTheThings() T-Shirt (Red) | Rane      | Thou     | 1023    | Total: $88.53 |
      | Sauce Labs Onesie           | Test.allTheThings() T-Shirt (Red) | Sauce Labs Bike Light             | Michael   | Jordan   | 5390    | Total: $36.69 |


  Scenario Outline: Remove button should remove the item from the cart
    Given the '<item1>' is added to the cart
    And the '<item2>' is added to the cart
    And the 'Cart' button is clicked
    And the '<item1>' is removed from the cart
    Then the '<item1>' should not be in the cart
    And the '<item2>' should be in the cart
    Examples:
      | item1                       | item2                             |
      | Sauce Labs Backpack         | Sauce Labs Bike Light             |
      | Sauce Labs Bolt T-Shirt     | Sauce Labs Fleece Jacket          |
      | Sauce Labs Onesie           | Test.allTheThings() T-Shirt (Red) |