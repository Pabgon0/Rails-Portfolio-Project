class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category   
  has_many :reviews
  has_many :users, through: :reviews 
  validates :name, presence: true  
  

  def self.alpha
    order(:name) 
  end

  def category_attributes=(attributes)
    self.category = Category.find_or_create_by(attributes) if !attributes['name'].empty?
    self.category 
  end

  def category_name
    category.try(:name)
  end
    
  def name_and_category
    "#{name} - #{category.try(:name)}"
  end
end