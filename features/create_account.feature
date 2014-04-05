Feature: create an account for a user in different criteria

    As a new user
    I should be able to create an account with a password

    Background: users have been added to database

        Given the following users exist:
            |first_name |last_name | email   | password|
            |first      |last      | 123@gmail.com   | password|
            |first      |last      | 124@gmail.com   | password|
            |first      |last      | 125@hotmail.com | password|
            |first      |last      | 126@hotmail.com | password|

        And I am on the register page

    Scenario: create an account successfullly
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 127@gmail.com |
            | Password      | password      |
            | Reenter       | password      |
        And I press "Register"
        Then I should be on home page
        And I should see "Register Successful!"
        When I fill in the following:
            | Email     | 127@gmail.com       |
            | Password  | password            |
        And I press "Login"
        Then I should be on "newsfeed page"

    Scenario: create an account without email address
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Password      | password      |
            | Reenter       | password      |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Please fill in email address"

    Scenario: create an account without password
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 128@gmail.com |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Please fill in password"

    Scenario: create an account with an existing email address
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 124@gmail.com |
            | Password      | password      |
            | Reenter       | password      |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "The email address exists"

    Scenario: create an account without reentering the password
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 129@gmail.com |
            | Password      | password      |
        And I press "Register"
        Then I should see "Register Failed!"
        And I should see "Please enter your password again"

    Scenario: create an account without reentering the same password
        When I fill in the following:
            | First Name    | first         |
            | Last Name     | last          |
            | Email Address | 120@gmail.com |
            | Password      | password      |
            | Reenter       | password1     |
        And I press "Finish"
        Then I should see "Sign up failed"
        And I should see "Please reenter the same password"
