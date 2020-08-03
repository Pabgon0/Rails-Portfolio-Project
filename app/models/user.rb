class User < ApplicationRecord
  has_secure_password 
  has_many :reviews
  has_many :reviewed_games, through: :reviews, source: :game
  has_many :games
  validates :email, presence: true 

  def self.create_by_facebook_omniauth(auth)
    self.find_or_create_by(name: auth[:info][:email]) do |a|
    a.email = auth[:info][:email]  
    a.password = SecureRandom.hex  
    end
  end
end