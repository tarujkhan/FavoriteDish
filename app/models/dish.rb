class Dish < ApplicationRecord
    belongs_to :user
    belongs_to :cuisine
    accepts_nested_attributes_for :cuisine 
end
