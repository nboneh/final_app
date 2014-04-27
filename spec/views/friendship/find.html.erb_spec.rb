require 'spec_helper'

describe "friendship/find.html.erb" do
  #pending "add some examples to (or delete) #{__FILE__}"
   describe "findfriends page" do
  	before {visit '/login'}
  	let(:user) { FactoryGirl.create(:user) }

  	before do
    	fill_in "Email",    with: user.email.upcase
    	fill_in "Password", with: user.password
    	click_button "Login"
    	click_link "Find Friends"
  	end

 	describe "find friends successuflly" do
 		before do
  			fill_in "Search for:", with: user.first_name
  			click_button "Search"
  		end
  		it "should have input add the user" do
  			expect(page).to should.have_input('add '+user.first_name+' '+user.last_name)
  		end
  	end
  end
end
