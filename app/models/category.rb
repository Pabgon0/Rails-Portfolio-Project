class Category < ApplicationRecord
    has_many :games

    validates :name, presence: true, uniqueness: true  

    scope :alpha, -> {order(:name)} 
end