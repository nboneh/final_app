# Add a declarative step here for populating the DB with movies.

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end


Then /I should see (all|none) of the users/ do |query|
   users =  Movie.all_ratings
    for user in users
      if query == "all"
        step "I should see #{user}"
      else 
        step "I should not see #{user}"
      end 
    end

end
