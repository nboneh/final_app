Feature: Allow valid users to send each other friend requests 

    As a user so that I can send data to my friends I should be able to accept, decline, or remove friends at the profile preference page and also access their profile.  

    Background: users have been added to database 

        Given the following users exist:
            | first_name     | last_name | email          | password | password_confirmation |
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

        And I am logged in as "User one" with password "password"

    Scenario: Sending a friend request 
        When I follow "Find Friends"
        And I fill in "name" with "two"
        And I press "Search"
        Then I should see "User two"
        When I press "Add User two"
        And I log out
        And I log in as "User two" with password "password"
        Then I should see "1 new friend request"

    Scenario: Accepting a friend request
        When "User two" sends "User one" a friend request
        And I follow "1 new friend request"
        Then I should be on the preferences page
        When I press "Accept!" 
        And I follow "User two"
        Then I should see "Already Friends!"

    Scenario: Rejecting a friend request
        When "User two" sends "User one" a friend request
        And I follow "1 new friend request"
        Then I should be on the preferences page
        When I press "Reject!" 
        Then I should not see "User two"

    Scenario: Searching friend by last name
        When I follow "Find Friends"
        And I fill in the following:
            | name | one |
        And I press "Search"
        Then I should see "User one"


    Scenario: Searching friend by first name
        When I follow "Find Friends" 
        And I fill in the following:
            | name | User |
        And I press "Search"
        Then I should see all of the users
