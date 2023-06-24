Feature: Admin Registration

  Scenario: Successful Admin Registration
    Given I am on the Admin Register screen
    When I enter valid registration details
    And I tap on the "Sign Up" button
    Then I should be registered successfully

  Scenario: Admin Registration with Invalid Email
    Given I am on the Admin Register screen
    When I enter an invalid email address
    And I tap on the "Sign Up" button
    Then I should see an error message for invalid email

  Scenario: Admin Registration with Invalid Phone Number
    Given I am on the Admin Register screen
    When I enter an invalid phone number
    And I tap on the "Sign Up" button
    Then I should see an error message for invalid phone number

  Scenario: Admin Registration with Password Mismatch
    Given I am on the Admin Register screen
    When I enter passwords that do not match
    And I tap on the "Sign Up" button
    Then I should see an error message for password mismatch

  Scenario: Admin Registration with Empty Location
    Given I am on the Admin Register screen
    When I leave the location field empty
    And I tap on the "Sign Up" button
    Then I should see an error message for empty location

