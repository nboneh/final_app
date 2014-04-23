Feature: create an account for a user in different criteria

    As a new user
    I should be able to create an account with a password

    Background: users have been added to database

        Given the following users exist:
            |first_name |last_name | email   | password| password_confirmation|
            |first      |last      | 123@gmail.com   | password| password|
            |first      |last      | 124@gmail.com   | password| password|
            |first      |last      | 125@hotmail.com | password| password|
            |first      |last      | 126@hotmail.com | password| password|

        And I am on the register page

    Scenario: create an account successfullly
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 127@gmail.com |
            | Password      | password      |
            | Reenter Password       | password      |
        And I press "Register"
        Then I should be on the login page
        And I should see "Register Successful!"
        When I fill in the following:
            | Email     | 127@gmail.com       |
            | Password  | password            |
        And I press "Login"
        Then I should be on the newsfeed page

    Scenario: create an account without email address
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Password      | password      |
            | Reenter Password      | password      |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Email can't be blank"

    Scenario: create an account without password
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 128@gmail.com |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Password is too short"

    Scenario: create an account with an existing email address
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 124@gmail.com |
            | Password      | password      |
            | Reenter Password      | password      |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Email has already been taken"

    Scenario: create an account without reentering the same password
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 120@gmail.com |
            | Password      | password      |
            | Reenter Password      | password1     |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Password confirmation doesn't match Password"
