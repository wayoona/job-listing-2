class Job < ApplicationRecord
 validates :title, :description,:up_bound,:dw_bound, presence: true
validates :dw_bound, numericality: { greater_than: 0}

def publish!

  self.is_hidden = true
  self.save
end

def hidden!
  self.is_hidden = false
  self.save
end
end
