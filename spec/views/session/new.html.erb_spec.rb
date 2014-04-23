require 'spec_helper'

describe "sessions/new.html.erb" do
	describe "login page" do
		before {visit '/login'}
		it "should have content 'Login'" do
			expect(page).to have_content('Login')
		end

	end

	describe "login" do
		before {visit '/login'}
		let(:user) { FactoryGirl.create(:user) }
		describe "with invalid information" do
      		before { click_button "Login" }

	      	it "should have content 'Login'" do
	      		expect(page).to have_content('Login')
	      	end
	      	it "should have a alert" do
	      		expect(page).to have_selector('h2#error')
	      	end


		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }

      		before do
        		fill_in "Email",    with: user.email.upcase
        		fill_in "Password", with: user.password
        		click_button "Login"
      		end
      		it "should have content 'Welcome first_name last_name'" do
      			expect(page).to have_content("Welcome "+user.first_name+" "+user.last_name)
      		end

         # it "should have link with a picture" do
          #  expect(page).to have_link('img', href: user_path(user))
          #end

      		it "should have link 'Find Friends'" do
      			expect(page).to have_link('Find Friends', href: '/findfriends')
      		end

      		it "should have link 'Preferences'" do
      			expect(page).to have_link('Preferences', href: '/preferences')
      		end

      		it "should have link 'Logout'" do
      			expect(page).to have_link('Logout', href: '/login')
      		end

      		describe "followed by signout" do
        		before { click_link "Logout" }
        		it "should have button 'Login'" do
        			expect(page).to have_button("Login")
        		end
      		end

		end

	end

end