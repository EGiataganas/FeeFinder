require 'spec_helper'

describe HomeController do
  render_views


# test what I should see when I'm logged in
# test what I should see when I'm not logged in

  context "when I'm not logged in" do
    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end

      it 'should show "Login" link' do
        get :index
        response.body.should match 'Login'
      end
    end
  end

  context "when I'm logged in" do
    before (:each) do
      @user = FactoryGirl.create(:user, name: "Bob")
      sign_in @user
    end 
    
    describe "GET 'index'" do
      it "should be successful" do
        get :index
        response.body.should match 'Bob'
      end
    end
  end

end
