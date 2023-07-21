Feature: User Authentication on Splash Screen

  Scenario: User sees the logo and loading indicator on the splash screen
    Given the user opens the application
    When the splash screen is displayed
    Then the user should see the logo image
    And the user should see a loading indicator

  Scenario: User is redirected to the admin dashboard if logged in as admin
    Given the user opens the application
    And the user is logged in as admin with email "admin@gmail.com"
    When the splash screen is displayed
    Then the user should be redirected to the admin dashboard

  Scenario: User is redirected to the student dashboard if logged in as a student
    Given the user opens the application
    And the user is logged in as a student with email other than "admin@gmail.com"
    When the splash screen is displayed
    Then the user should be redirected to the student dashboard

  Scenario: User is redirected to the onboarding screen if not logged in
    Given the user opens the application
    And the user is not logged in
    When the splash screen is displayed
    Then the user should be redirected to the onboarding screen
