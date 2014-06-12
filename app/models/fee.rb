class Fee < ActiveRecord::Base

  attr_accessible :amount, :name #it create setters and getters

  validates :amount, numericality: true
  validates :name, uniqueness: true

  before_save -> {
  	if start_range && end_range
  	  self.type = "HearingFee"
  	else
  	  self.type = "NonMoneyClaimsFee"
  	end
  }

end
