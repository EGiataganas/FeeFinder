require 'spec_helper'

describe Fee do
  
  before(:each) do
    @attr = {
      :name => "Example Fee",
      :amount => 4800,
    }
  end

  it "should create a new instance given a valid attribute" do
    Fee.create!(@attr)
  end

  it "should be the amount to be payed" do
    no_amount_fee = Fee.new(@attr.merge(:amount => ""))
    no_amount_fee.should_not be_valid
  end

  it "should be valid when the High court fee is present" do
    fee = Fee.new(@attr.merge(:amount => "480"))
    fee.should be_valid
  end

 it "should be valid when the Small court fee is present" do
    fee = Fee.new(@attr.merge(:amount => "250"))
    fee.should be_valid
  end

  it "should not be valid when the fee is present the amount" do
    fee = Fee.new(@attr.merge(:amount => "18kn"))
    fee.should_not be_valid
  end

end
