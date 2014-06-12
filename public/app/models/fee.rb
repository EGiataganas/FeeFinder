class Fee < ActiveRecord::Base
  attr_accessible :amount, :name #it create setters and getters

  validates :amount, numericality: true
  validates :name, uniqueness: true

end
