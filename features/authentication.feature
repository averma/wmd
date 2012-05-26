Feature: Authentication
In order to create a contact
Users
should be able to signup, login and logout

Scenario: SignUp
    Given I go to the sign up page
    When  I fill in "Jhantoo" for "Name"
    And   I fill in "jhantoo@circarconsulting" for "Email"
    And   I fill in "abc123" for "Password"
    And   I fill in "abc123" for "user_password_confirmation"
    And   I press "Sign up"
    Then  I go to  home page


Scenario: Login
    Given a valid user
    When I go to the sign in page
    And  I fill in the following:
        |Email|jhantoo@circarconsulting.com|
        |Password|abc123|
    When I press "Sign in"
    Then  I should see "Signed in successfully."
    Then  I go to  home page 

Scenario: Invalid User Login
    Given a valid user
    When I go to the sign in page
    And  I fill in the following:
        |Email|jhantoo@circarconsulting.com|
        |Password|abc1234|
    When I press "Sign in"
    Then  I should see "Invalid email or password."
    Then  I go to  home page