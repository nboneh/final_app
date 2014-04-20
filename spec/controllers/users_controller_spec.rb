require 'spec_helper'

describe UsersController do
  describe "GET 'profile'" do
    it "returns http success" do
      get 'profile'
      response.should be_success
    end
  end

  describe "GET 'preferences'" do
    it "returns http success" do
      get 'preferences'
      response.should be_success
    end
  end

  describe "GET 'newfeed'" do
    it "returns http success" do
      get 'newfeed'
      response.should be_success
    end
  end

  describe "register" do
    it "create an account successfully" do
      before { visit '/register' }
    end
  end

end
