require 'spec_helper'

describe "user/preferences.html.erb" do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "preferences page" do
  	before {visit '/login'}
  	let(:user) { FactoryGirl.create(:user) }

  	before do
    	fill_in "Email",    with: user.email.upcase
    	fill_in "Password", with: user.password
    	click_button "Login"
    	click_link "Preferences"
  	end

  	it "should have 'User#preferences'" do
  		expect(page).to have_content('User#preferences')
  	end
  end
end
