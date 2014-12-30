class ConstructorMarket < ActiveRecord::Base
  belongs_to :chassis_manufacturer

  before_save :ensure_max_min_value, on: [ :create, :update ]

  private

  def ensure_max_min_value
    self.value = 150_000_000 if self.value > 150_000_000
    self.value = 2_000_000   if self.value < 2_000_000
  end
end
