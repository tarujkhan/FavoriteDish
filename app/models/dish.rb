class Dish < ApplicationRecord
    belongs_to :user
    belongs_to :cuisine
    accepts_nested_attributes_for :cuisine 
    accepts_nested_attributes_for :user

    # scope :sort_a_to_z, -> {where("price > ?", 50).order(:name)}
end
