class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :game
    validates :title, presence: true  
    validates :title, length: {maximum: 40}
    validates :content, length: {maximum: 250} 
    validates :game, uniqueness: { scope: :user, message: "has already been reviewed by you."  }
end