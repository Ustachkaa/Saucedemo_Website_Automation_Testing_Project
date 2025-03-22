# Saucedemo Website Automation Testing Project

This project focuses on automating the testing of the [Saucedemo](https://www.saucedemo.com) website using Selenium WebDriver and Java. The automation suite covers various functionalities, including user authentication, product interactions, and the checkout process.

## Project Overview

The goal of this project is to ensure the reliability and functionality of the Saucedemo website through automated testing. By simulating user interactions, we can validate that the website behaves as expected under various scenarios.

## Technologies Used

- **Java**: Primary programming language for the test scripts.
- **Selenium WebDriver**: Tool for automating web application testing.
- **JUnit**: Testing framework for Java applications.
- **Maven**: Build automation and dependency management tool.
- **Gherkin**: Language for writing human-readable test scenarios.
- **Cucumber**: Framework that supports Behavior-Driven Development (BDD).

## Test Cases

The automated tests cover the following scenarios:

1. **Login Functionality**:
   - Successful login with valid credentials.
   - Unsuccessful login with invalid credentials.

2. **Product Page**:
   - Viewing product details.
   - Adding products to the cart.
   - Sorting products by various criteria.

3. **Shopping Cart**:
   - Viewing items in the cart.
   - Removing items from the cart.
   - Proceeding to checkout.

4. **Checkout Process**:
   - Entering user information.
   - Completing the purchase.
  
## Setup and Installation

1. **Clone the Repository**  
   - Click the "Code" button and select "Download ZIP" to download the project.  
   - Extract the ZIP file to a folder on your computer.  

2. **Install Java and Maven**  
   - Ensure you have **Java Development Kit (JDK)** installed (version 11 or higher is recommended).  
   - Download and install [Maven](https://maven.apache.org/).  
   - Add Maven and Java to your system's environment variables (PATH).  

3. **Set Up WebDriver**  
   - Download the appropriate **WebDriver** for your browser:  
     - [ChromeDriver](https://sites.google.com/chromium.org/driver/) for Google Chrome.  
     - [GeckoDriver](https://github.com/mozilla/geckodriver/releases) for Mozilla Firefox.  
   - Ensure the WebDriver executable is placed in a known directory and added to your system's PATH.  

4. **Open the Project**  
   - Open the project folder in your preferred **IDE** (e.g., **IntelliJ IDEA**, **Eclipse**, or **Visual Studio Code**).  
   - Allow the IDE to import dependencies from the `pom.xml` file automatically.  

## Running the Tests

1. **Using IntelliJ IDEA or Eclipse:**  
   - Locate the test runner class.
   - Right-click on the runner class named `RunCucumberTest.java`.  
   - Select **Run 'RunCucumberTest'** to execute the tests.  

2. **Using the Terminal in the IDE:**  
   - Open the terminal inside your IDE.  
   - Ensure Maven is properly set up and all dependencies are loaded.  
   - Execute the tests by running the main test runner class (`RunCucumberTest.java`).  

3. **View Test Reports:**  
   - After the tests complete, check the `target/surefire-reports` directory for detailed test execution reports.  
