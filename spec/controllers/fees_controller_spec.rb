
require 'spec_helper'

#RSpec.describe FeeController, :type => :controller do
describe FeesController do

  render_views

  before (:each) do
    @feeTest = FactoryGirl.create(:fee)
    # sign_in @user
  end
  # # This should return the minimal set of attributes required to create a valid
  # # Studet. As you add validations to Studet, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # # This should return the minimal set of values that should be in the session
  # # in order to pass any filters (e.g. authentication) defined in
  # # StudetsController. Be sure to keep this updated too.
  # let(:valid_session) { {} }

# context "when user is NOT logged in" do 

#   describe "GET 'show'" do
    
#     it "should be successful" do
#       get :show, :id => @user.id
#       response.should_not be_success
#     end
    
#     it "should find the right user" do
#       get :show, :id => @user.id
#       response.should redirect_to(new_user_session)
#     end
#   end
# end 

# context "when user is logged in must be able to view, edit & delete fee" do 
#   before (:each) do
#     @user = FactoryGirl.create(:user)
#     @fee = FactoryGirl.create(:fee)
#     sign_in @user
#   end

#   describe "GET 'show'" do
    
#     it "should be successful" do
#       get :show, :id => @user.id
#       get :show, :id => @fee.id
#       response.should be_success
#     end
    
#     it "should find the right user" do
#       get :show, :id => @fee.id
#       assigns(:fee).should == @fee
#     end
#   end
# end 

describe "GET 'index'" do
      it "should be successful" do
        get :index
        response.should be_success
      end

      # it 'should show "Login" link' do
      #   get :index
      #   response.body.should match 'Login'
      # end
    end

describe "GET index" do
    it "assigns all fees as fees" do
      fee = FactoryGirl.create(:fee)
      get :index#, {}, valid_session

    # assert_response :success
    # assert_not_nil assigns(:fees)
      expect(assigns(:fees)).to eq([@fee])
    end

    # when I visit '/' i expect the status code to be 200 or success
    # when I'm not logged in I expect to see 'log in'
    # when I'm logged in I expect to see my name
    
  end

  describe "GET show" do
    it "assigns the requested fee as @fee" do
      get :show, :id => @fee.id
      response.should be_success
      # get :show, {:id => @fee.to_param}, valid_session
      # expect(assigns(:fee)).to eq(@fee)
      # expect(assigns(:fee)).to eq(@fee)

    end
  end

  describe "GET new" do
    it "assigns a new fee as @fee" do
      get :new, {}, valid_session
      expect(assigns(:fee)).to be_a_new(Fee)
    end
  end

  describe "GET edit" do
    it "assigns the requested fee as @fee" do
      get :edit, {:id => @fee.to_param}, valid_session
      expect(assigns(:fee)).to eq(@fee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Fee" do
        expect {
          post :create, {:fee => valid_attributes}, valid_session
        }.to change(Fee, :count).by(1)
      end

      it "assigns a newly created fee as @fee" do
        post :create, {:fee => valid_attributes}, valid_session
        expect(assigns(:fee)).to be_a(Fee)
        expect(assigns(:fee)).to be_persisted
      end

      it "redirects to the created fee" do
        post :create, {:fee => valid_attributes}, valid_session
        expect(response).to redirect_to(Fee.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fee as @fee" do
        post :create, {:fee => invalid_attributes}, valid_session
        expect(assigns(:fee)).to be_a_new(Fee)
      end

      it "re-renders the 'new' template" do
        post :create, {:fee => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested fee" do
        put :update, {:id => @fee.to_param, :fee => new_attributes}, valid_session
        fee.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested fee as @fee" do
        put :update, {:id => @fee.to_param, :fee => valid_attributes}, valid_session
        expect(assigns(:fee)).to eq(@fee)
      end

      it "redirects to the fee" do
        put :update, {:id => @fee.to_param, :fee => valid_attributes}, valid_session
        expect(response).to redirect_to(@fee)
      end
    end

    describe "with invalid params" do
      it "assigns the fee as @fee" do
        put :update, {:id => @fee.to_param, :fee => invalid_attributes}, valid_session
        expect(assigns(:fee)).to eq(@fee)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @fee.to_param, :fee => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  # describe "DELETE destroy" do
  #   it "destroys the requested fee" do
  #     expect {
  #       delete :destroy, {:id => @fee.to_param}, valid_session
  #     }.to change(Fee, :count).by(-1)
  #   end

  #   it "redirects to the fees list" do
  #     delete :destroy, {:id => @fee.to_param}, valid_session
  #     expect(response).to redirect_to(fees_url)
  #   end
  # end

end
