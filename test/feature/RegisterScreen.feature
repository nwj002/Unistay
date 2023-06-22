Feature: User Registration
  As a user
  I want to register with my email, phone number, and password
  So that I can access the app's features

  Scenario: Successful registration
    Given I am on the registration screen
    When I enter a valid email
    And I enter a valid phone number
    And I enter a valid password
    And I confirm the password
    And I tap the "Sign Up" button
    Then I should be redirected to the verification screen

  Scenario: Registration with invalid email
    Given I am on the registration screen
    When I enter an invalid email
    And I enter a valid phone number
    And I enter a valid password
    And I confirm the password
    And I tap the "Sign Up" button
    Then I should see an error message indicating an invalid email

  Scenario: Registration with invalid phone number
    Given I am on the registration screen
    When I enter a valid email
    And I enter an invalid phone number
    And I enter a valid password
    And I confirm the password
    And I tap the "Sign Up" button
    Then I should see an error message indicating an invalid phone number

  Scenario: Registration with invalid password
    Given I am on the registration screen
    When I enter a valid email
    And I enter a valid phone number
    And I enter an invalid password
    And I confirm the password
    And I tap the "Sign Up" button
    Then I should see an error message indicating an invalid password

  Scenario: Registration with mismatched passwords
    Given I am on the registration screen
    When I enter a valid email
    And I enter a valid phone number
    And I enter a valid password
    And I enter a different password for confirmation
    And I tap the "Sign Up" button
    Then I should see an error message indicating password mismatch
