class DriverMarket < ActiveRecord::Base
  belongs_to :driver

  #validation here. Value needs to be between 2M and 150M
  #validation here. Score needs to be >= 0
  
  before_save :ensure_max_min_value, on: [ :create, :update ]

  private

  def ensure_max_min_value
    self.value = 150_000_000 if self.value > 150_000_000  
    self.value = 2_000_000   if self.value < 2_000_000  
  end
end
