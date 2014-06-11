require 'spec_helper'

describe UsersController do

  context "when user is NOT logged in" do 

    before (:each) do
      @user = FactoryGirl.create(:user)
    end
    
    describe "GET 'show'" do

      it "should not be successful" do
        get :show, :id => @user.id
        response.should_not be_success
      end
    end
  end 

  context "when user is logged in" do 

    before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET 'show'" do

      it "should be successful" do
        get :show, :id => @user.id
        response.should be_success
      end
      
      it "should find the right user" do
        get :show, :id => @user.id
        assigns(:user).should == @user
      end
    end
  end 

end
