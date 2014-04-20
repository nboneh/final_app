require 'spec_helper'

describe "users/new.html.erb" do
	describe "register page" do
		before {visit '/register'}
		it "should have the content 'Register'" do
		  expect(page).to have_content('Register')
		end
		#it {should have_content('Register')}
	end

	describe "register" do
		before {visit '/register'}
		let(:submit) {"Register"}

		describe "with invalid information" do
      		it "should not create a user" do
        		expect { click_button submit }.not_to change(User, :count)
      		end
    	end

	    describe "with valid information" do
	      before do
	        fill_in "First Name",  	with: "First"
	        fill_in "Last Name",	with: "Last"
	        fill_in "Email Address",with: "user@example.com"
	        fill_in "Password",     with: "password"
	        fill_in "Reenter Password", with: "password"
	      end

	      it "should create a user" do
	        expect { click_button submit }.to change(User, :count).by(1)
	      end
	    end

	end
end