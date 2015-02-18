Feature: Login
  In order to view my tasks
  As a organized person
  I want to login

  @javascript
  Scenario: Signup Failure
    Given that a user with email "user@example.com" and password "rahasyam" exist
    And  I am in home page
    When I press "Signup" in "header"
    And I fill in "user[email]" with "user@example.com"
    And I fill in "user[password]" with "rahasyam"
    And I fill in "user[password_confirmation]" with "rahasyam"
    And I press "Signup" in "form"
    Then I should see "Email has already been taken"

  @javascript
  Scenario: Signup Sucess
    When I am in home page
    When I press "Signup" in "header"
    Then I should see "Create Your Account"
    When I fill in "user[email]" with "bv@gm.co"
    And I fill in "user[password]" with "rahasyam"
    And I fill in "user[password_confirmation]" with "rahasyam"
    And I press "Signup" in "form"
    Then I should see "A message with a confirmation link has been sent to your email address"
    When I follow the link "Confirm my account" in the last email sent to "bv@gm.co"
    Then I should see "Your email address has been successfully confirmed"
    When I fill in "user[email]" with "bv@gm.co"
    And I fill in "user[password]" with "secret"
    And I press "Login" in "form"
    Then I should see "Invalid email or password"
    When I fill in "user[email]" with "bv@gm.co"
    And I fill in "user[password]" with "rahasyam"
    And I press "Login" in "form"
    Then I should see "Logged in as"

  @javascript
  Scenario: Login Failure
    Given that a user with email "user@example.com" and password "rahasyam" exist
    And I am in home page
    When I press "Login" in "header"
    And I fill in "user[email]" with "user@example.com"
    And I fill in "user[password]" with "secret"
    And I press "Login" in "form"
    Then I should see "Invalid email or password"
    And I fill in "user[email]" with "user@example.com"
    And I fill in "user[password]" with "rahasyam"
    And I press "Login" in "form"
    Then I should see "Logged in as"

  @javascript
  Scenario: Login Success
    Given that a user with email "user@example.com" and password "rahasyam" exist
    And I am in home page
    When I press "Login" in "header"
    And I fill in "user[email]" with "user@example.com"
    And I fill in "user[password]" with "rahasyam"
    And I press "Login" in "form"
    And I should see "Logged in as user@example.com"
    When I press "Logout"
    Then I should not see "Logged in as"
    And I should see "Login" within "header"
