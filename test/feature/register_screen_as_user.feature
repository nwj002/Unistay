Feature: Registration Screen as user

  Scenario: Successful registration as user
    Given I am on the registration screen
    When I enter my email address as "test@example.com"
    And I enter my phone number as "1234567890"
    And I enter my password as "password"
    And I confirm my password as "password"
    And I submit the registration form
    Then I should see a success message "Registered!"
