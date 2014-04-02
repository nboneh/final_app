# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # movie = Movie.where("title = ? ", movie[:title]).first(3)   
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  firstPos = page.body.index(e1)
  secondPos = page.body.index(e2)
  firstPos.should < secondPos
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings( that are not)?: (.*)/ do |uncheck, arenot, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(',') 
  
  if arenot
    comp_ratings = Movie.all_ratings
    for rating in ratings
      comp_ratings.delete(rating)
    end
    ratings = comp_ratings
  end 
  
  for rating in ratings do
      step "I #{uncheck}check \"ratings_#{rating}\""
  end
end


Then /I should (not )?see movies of ratings( that are not)?: (.*)/ do |notsee, arenot, rating_list|
  ratings = rating_list.split(',')
  #"are not" as in not those ratings so we get the comp ratings
  if arenot
    comp_ratings = Movie.all_ratings
    for rating in ratings
        comp_ratings.delete(rating)
    end
    ratings = comp_ratings
  end 

  
  for rating in ratings
    #not see length should be zero for that rating
    #otherwise there should be the same number in the page as in the table 
    if notsee
      page.body.scan(/<td>#{rating}/).length.should == 0
    else
      page.body.scan(/<td>#{rating}<\/td>/).length.should == Movie.find_all_by_rating(rating).length 
    end
  end
end

When /I (un)?check all the ratings/ do |uncheck|
  ratings =  Movie.all_ratings
  rating_list = ""
  for rating in ratings
    rating_list.concat(rating)
    rating_list.concat(",")
  end
  step "I #{uncheck}check the following ratings: #{rating_list}"
end

Then /I should see (all|none) of the movies/ do |query|
   ratings =  Movie.all_ratings
    rating_list = ""
    for rating in ratings
        rating_list.concat(rating)
        rating_list.concat(",")
    end

    if query == "all"
        step "I should see movies of ratings: #{rating_list}"
    else 
       step "I should not see movies of ratings that are not: #{rating_list}"
    end 

end
