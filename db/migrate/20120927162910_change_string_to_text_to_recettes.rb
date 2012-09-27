class ChangeStringToTextToRecettes < ActiveRecord::Migration
  def up
  	change_column :recettes, :description, :text
  	change_column :recettes, :preparation, :text
  	change_column :recettes, :ingredients, :text
  end

  def down
  end
end
