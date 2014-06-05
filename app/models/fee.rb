class Fee < ActiveRecord::Base
  # attr_accessible :amount, :name #it doesnt create setters and getters

  attr :amount, :name #it creates setters and getters
  validates :amount, numericality: true
end
