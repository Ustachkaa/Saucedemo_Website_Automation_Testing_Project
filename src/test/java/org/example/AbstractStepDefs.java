package org.example;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.*;


import java.time.Duration;

public abstract class AbstractStepDefs {

    private static final int WAIT_TIME = 10;

    public static final WebDriver driver;

    protected static HomePage homePage;

    static {


        WebDriverManager.chromedriver().setup();
        ChromeOptions options = new ChromeOptions();

        driver = new ChromeDriver(options);

        driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(WAIT_TIME));
        homePage = new HomePage(driver);
    }

}
