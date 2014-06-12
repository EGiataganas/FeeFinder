class HearingFee < Fee

  attr_accessible :start_range, :end_range #it create setters and getters

  validates :start_range, numericality: true, presence: true
  validates :end_range, numericality: true, presence: true

end
