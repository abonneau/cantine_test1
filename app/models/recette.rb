class Recette < ActiveRecord::Base
	resourcify
  attr_accessible :description, :ingredients, :preparation, :titre

  belongs_to :user

  validates :user_id, :presence => true

  default_scope :order => 'recettes.created_at DESC'




end
