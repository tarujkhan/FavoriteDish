class Dish < ApplicationRecord
    belongs_to :foodlover
    belongs_to :cuisine
end
