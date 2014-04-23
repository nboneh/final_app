Feature: Allow valid users to login with the correct password

    As a user so that I can use the full functionality of the site I want to be
    able to login with a valid account and password

    Background: users have been added to database 

        Given the following users exist:
            | first_name     | last_name | email          | password |  password_confirmation |
            |  User          | one       | testing1@test.com      | password | password |
            |  User          | two       | testing2@test.com      | password | password |
            |  User          | three     | testing3@test.com      | password | password |
            |  User          | four      | testing4@test.com      | password | password |
            |  User          | five      | testing5@test.com      | password | password |
            |  User          | six       | testing6@test.com      | password | password |
            |  User          | seven     | testing7@test.com      | password | password |
            |  User          | eight     | testing8@test.com      | password | password |
            |  User          | nine      | testing9@test.com      | password | password |
            |  User          | ten       | testing10@test.com     | password | password |

        And I am on the login page

    Scenario: Login successfully
        When I fill in the following:
            | Email     | testing1@test.com   |
            | Password  | password            |
        When I press "Login"
        Then I should be on the newsfeed page
        And I should see "Welcome User one"
        When I follow "Profile Picture"
        Then I should be on User one's profile

    Scenario: Login Failure 
        When I fill in the following:
            | Email     | testing1@test.com   |
            | Password  | notmypassword1234   |
        When I press "Login"
        Then I should be on the login page
        And I should see "Invalid email/password combination"

