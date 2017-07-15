class Job < ApplicationRecord
 validates :title, :description,:up_bound,:dw_bound, presence: true
validates :dw_bound, numericality: { greater_than: 0}

end
