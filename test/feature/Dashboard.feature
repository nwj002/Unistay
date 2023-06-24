Feature: User Dashboard

  Scenario: User registration with invalid details
    Given I am on the registration screen
    When I enter invalid registration details
    And I tap on the register button
    Then I should see an error message


  Scenario: User registration with existing email
    Given I am on the registration screen
    When I enter an email that already exists
    And I tap on the register button
    Then I should see an error message

