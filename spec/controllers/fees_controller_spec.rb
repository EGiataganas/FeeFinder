
require 'spec_helper'

describe FeesController do

  # render_views
  context "when user is NOT logged in" do 

    describe "GET 'index'" do

      it "should be successful" do
        get :index
        response.should_not be_success
      end
    end
  end 

  context "when user is logged in" do 

    let(:user_factory) { :user }

    before (:each) do
      @user = FactoryGirl.create(user_factory)
      sign_in @user
    end

    let(:fee) {FactoryGirl.create(:fee)}

    let(:valid_attributes) do
          {'fee'=> {'amount'=>222, 'name'=>'TestFee'}}
        end

  # context "when user is NOT logged in" do 

  describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

     # it 'should show "Show" link' do
     #   get :index
     #   response.body.should match 'Show'
     # end

     it "assigns @fees" do
      fee = FactoryGirl.create(:fee)
      get :index

      assert_response :success
      assert_not_nil assigns(:fees)
      #expect(assigns(:fees)).to eq([@fee])
    end
  end

    # when I visit '/' i expect the status code to be 200 or success
    # when I'm not logged in I expect to see 'log in'
    # when I'm logged in I expect to see my name
    
  describe "GET 'show'" do
    it "should be successful" do
      #ap fee, :plain => true this for debugging to show us the values of fee
      get :show, :id => fee.id
      response.should be_success
    end

    it "assigns the requested fee as @fee" do
      get :show, :id => fee.id
      assigns(:fee).should ==fee
    end
  end

  describe "GET new" do
    context "user is admin" do
      let(:user_factory) { :admin }     
      it "assigns a new fee as @fee" do
        get :new, {}
        expect(assigns(:fee)).to be_a_new(Fee)
      end
    end
    context "user is not admin" do 
      it "redirects to the fees index" do
        get :new, {}
        response.should redirect_to(fees_path)
      end
    end
  end

  describe "GET edit" do
    it "assigns the requested fee as @fee" do
      ap fee, :plain => true
      get :edit, :id => fee.id
      expect(assigns(:fee)).to eq(fee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Fee" do
        expect { post :create, valid_attributes
          }.to change(Fee, :count).by(1)
        end

        it "assigns a newly created fee as @fee" do
          post :create, valid_attributes
          expect(assigns(:fee)).to be_a(Fee)
          expect(assigns(:fee)).to be_persisted
        end

        it "redirects to the created fee" do
          post :create,valid_attributes
          expect(response).to redirect_to(Fee.last)
        end
      end


    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) do
          {"fee"=> {"amount"=>30, "name"=>"TestFee2"}}
        end
          
      it "updates the requested fee" do
        puts new_attributes.inspect
        new_attributes[:id] = fee.id
        put :update,  new_attributes
        fee.reload
        # skip("Add assertions for updated state")
      end

      it "assigns the requested fee as @fee" do
        puts valid_attributes.inspect
        valid_attributes[:id] = fee.id
        put :update, valid_attributes
        expect(assigns(:fee)).to eq(fee)
      end

      it "redirects to the fee" do
        # put :update, {:id => fee.to_param, valid_attributes}
        puts valid_attributes.inspect
        valid_attributes[:id] = fee.id
        put :update, valid_attributes
        expect(response).to redirect_to(fee)
      end
    end

  end
end

  # describe "DELETE destroy" do
  #   it "destroys the requested fee" do
  #     expect {
  #       delete :destroy, {:id => @fee.to_param}
  #     }.to change(Fee, :count).by(-1)
  #   end

  #   it "redirects to the fees list" do
  #     delete :destroy, {:id => @fee.to_param}
  #     expect(response).to redirect_to(fees_url)
  #   end
  # end
end
