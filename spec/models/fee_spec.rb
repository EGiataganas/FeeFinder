require 'spec_helper'

describe Fee do
  
  before(:each) do
    @attrs = {
      :name => "Example Fee",
      :amount => 4800,
    }
  end

  it "should create a new instance given a valid attrsibute" do
    Fee.create!(@attrs)
  end

  it "should be the amount to be payed" do
    no_amount_fee = Fee.new(@attrs.merge(:amount => ""))
    no_amount_fee.should_not be_valid
  end

  it "should be valid when the High court fee is present" do
    fee = Fee.new(@attrs.merge(:amount => "480"))
    fee.should be_valid
  end

 it "should be valid when the Small court fee is present" do
    fee = Fee.new(@attrs.merge(:amount => "250"))
    fee.should be_valid
  end

  it "should not be valid when the fee is present the amount" do
    fee = Fee.new(@attrs.merge(:amount => "18kn"))
    fee.should_not be_valid
  end
  
  it "should not be valid when they have the same name" do
    Fee.create(@attrs)
    fee = Fee.create(@attrs)
    fee.should_not be_valid
  end
end
