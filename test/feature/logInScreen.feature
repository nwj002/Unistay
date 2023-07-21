Feature: User Login
  As a user
  I want to log in to my account
  So that I can access the application

  Scenario: Successful Login
    Given I am on the Login Screen
    When I enter my email as "<email>"
    And I enter my password as "<password>"
    And I tap on the Login button
    Then I should be redirected to the Dashboard

  Scenario: Login with Incorrect Credentials
    Given I am on the Login Screen
    When I enter an incorrect email
    And I enter an incorrect password
    And I tap on the Login button
    Then I should see an alert box with an error message

  Scenario: Login with Missing Credentials
    Given I am on the Login Screen
    When I leave the email field empty
    And I leave the password field empty
    And I tap on the Login button
    Then I should see an error message for the email field
    And I should see an error message for the password field

  Scenario: Login as an Admin
    Given I am on the Login Screen
    When I enter my email as "admin@gmail.com"
    And I enter my password as "<password>"
    And I tap on the Login button
    Then I should be redirected to the Admin Dashboard

