require 'spec_helper'

describe SharedController do

  describe "GET '_error_messages'" do
    it "returns http success" do
      get '_error_messages'
      response.should be_success
    end
  end

end
