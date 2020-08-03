class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name 
      t.string :price
      t.integer :user_id
      t.integer :category_id  

      t.timestamps
    end
  end
end
