# Created by Mariam at 12/16/2024
Feature: Saucedemo navigation to other websites

  Background:
    Given the home page is opened
    And the 'Username' field is filled with 'standard_user'
    And the 'Password' field is filled with 'secret_sauce'
    And the 'Login' button is clicked

  Scenario: Navigate to About page
    Given the 'Menu' button is clicked
    When the 'About' button is clicked
    Then the user should be directed to 'https://saucelabs.com/'


