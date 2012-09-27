class CreateRecettes < ActiveRecord::Migration
  def change
    create_table :recettes do |t|
      t.string :titre
      t.string :description
      t.string :ingredients
      t.string :preparation
      t.integer :user_id

      t.timestamps
    end
    add_index :recettes, :titre
    add_index :recettes, :user_id
  end 
end
