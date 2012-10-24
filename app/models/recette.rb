class Recette < ActiveRecord::Base
	resourcify
  attr_accessible :description, :ingredients, :preparation, :titre

  belongs_to :user

  validates :user_id, :presence => true

  default_scope :order => 'recettes.created_at DESC'

  validates :titre, :presence => true
  
  validates :description, :presence => true

  validates :ingredients, :presence => true

  validates :preparation, :presence => true

  



end
