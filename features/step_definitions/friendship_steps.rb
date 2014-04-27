Given /the following friendships exist/ do |friendships_table|
      friendships_table.hashes.each do |friendship|
      Friendship.create!(friendship)
   end
end

When /^"(.*?)" sends "(.*?)" a friend request$/ do |user1, user2|
  user1split = user1.split(' ')
  user2split = user2.split(' ')
 user1id = User.where(:first_name => user1split[0], :last_name => user1split[1]).first.id
 user2id = User.where(:first_name => user2split[0], :last_name => user2split[1]).first.id
  step %{the following friendships exist:}, table(%{ 
        |sender_id | receiver_id | status |
        | #{user1id} | #{user2id} | pending |})
end



