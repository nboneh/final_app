Feature: Allow valid users to login with the correct password

    As a user so that I can use the full functionality of the site I want to be
    able to login with a valid account and password

    Background: users have been added to database 

        Given the following users exist:
            | first name     | last name | email address          | password     |
            |  User          | one       | testing1@test.com      | password     |
            |  User          | two       | testing2@test.com      | password     |
            |  User          | three     | testing3@test.com      | password     |
            |  User          | four      | testing4@test.com      | password     |
            |  User          | five      | testing5@test.com      | password     |
            |  User          | six       | testing6@test.com      | password     |
            |  User          | seven     | testing7@test.com      | password     |
            |  User          | eight     | testing8@test.com      | password     |
            |  User          | nine      | testing9@test.com      | password     |
            |  User          | ten       | testing10@test.com     | password     |

        And I am on the home page

    Scenario: Login successfully
        When I fill in the following:
            | Email     | testing1@test.com   |
            | Password  | password            |
        When I press "Login"
        Then I should be on the "newsfeed page"
        And I should see "Welcome User one"
        When I follow "profile"
        Then I sould be on the "profile page" 
        And I should see "Pending Friend Requests" 
        And I should see "Wall"

    Scenario: Login Failure 
        When I fill in the following:
            | Email     | testing1@test.com   |
            | Password  | notmypassword1234   |
        When I press "Login"
        Then I should be on the "home page"
        And I should see "Login Failure"
        And I should see "Username or Password incorrect"

