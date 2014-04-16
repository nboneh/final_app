Feature: Allow valid users to send each other friend requests 

    As a user so that I can send data to my friends I should be able to accept, decline, or remove friends at the profile preference page and also access their profile.  

    Background: users have been added to database 

        Given the following users exist:
            | first_name     | last_name | email          | password     |
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

        And I am logged in as "User one" with password "password"

    Scenario: Sending a friend request 
        When I follow "Find Friends"
        And I fill in "Name" with "tesing2@test.com"
        And I press "Search"
        Then show me the page
        Then I should see "User two"
        When I press "add User two"
        And I log out
        And I log in as "User two" with password "password"
        Then I should see "new friend request/s"

    Scenario: Accepting a friend request
        When "User two" sends "User one" a friend request
        And I follow "new friend request/s"
        Then I should be on "profile preferences page"
        When I press "Accept User two friend request" 
        And I follow "User two profile"
        Then I should see "You and user two are friends"
        When I follow "newsfeed"
        Then I should not see "new friend request/s" 

    Scenario: Rejecting a friend request
        When "User two" sends "User one" a friend request
        And I follow "new friend request/s"
        Then I should be on "profile preferences page"
        When I press "Reject User two friend request" 
        And I follow "User two profile"
        Then I should see "You and user two are not friends"
        When I follow "newsfeed"
        Then I should not see "new friend request/s" 

    Scenario: Searching friend by last name
        When I follow "Find Friends" 
        And I fill in the following:
            | Search | one |
        And I press "Submit"
        Then I should see "User one"


    Scenario: Searching friend by last name
        When I follow "Find Friends" 
        And I fill in the following:
            | Search | User |
        And I press "Submit"
        Then I should see all of the users
