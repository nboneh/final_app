# Add a declarative step here for populating the DB with movies.

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /^I am logged in as "(.*?)" with password "(.*?)"$/ do |user, pass|
   step "I log in as \"#{user}\" with password \"#{pass}\""
end


Then /I should see (all|none) of the users/ do |query|
   users = Users.find(:all)
    for user in users
      if query == "all"
        step "I should see #{user}"
      else 
        step "I should not see #{user}"
      end 
    end

end

When /^I log out$/ do
  step "I follow \"Log Out\""
end


When /^I log in as "(.*?)" with password "(.*?)"$/ do |user, pass|
  usersplit = user.split(' ')
   useremail = User.where(:first_name => usersplit[0], :last_name => usersplit[1]).first.email
   step %Q"I fill in the following:
          |email | #{useremail} |
          |password | #{pass}|"
  step "I press \"Login\""
end

