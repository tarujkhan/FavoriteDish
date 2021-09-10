class Cuisine < ApplicationRecord
    has_many :dishes
    has_many :foodlovers, through: :dishes
end
